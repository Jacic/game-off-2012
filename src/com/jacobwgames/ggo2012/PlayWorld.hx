package com.jacobwgames.ggo2012;

import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.Entity;
import com.haxepunk.World;
import com.haxepunk.HXP;
import haxe.xml.Fast;

/**
 * ...
 * @author Jacic
 */

class PlayWorld extends World
{
	private var levelWidth:Int;
	private var levelHeight:Int;
	private var beginX:Int;
	private var beginY:Int;
	private var clonesNeeded:Int;
	private var clonesText:Text;
	private var savedText:Text;
	private var clonesSaved:Int;
	private var clones:Array<Player>;
	private var buttons:Array<Button>;
	private var bMode:Int;
	private var buttonPrevState:String;
	private var switchStart:Bool;
	private var solidswitches:Array<SolidSwitch>;
	private var activeClone:Player;
	private var goal:Goal;
	
	public function new(level:Xml) 
	{
		super();
		
		Levels.curLevel += 1;
		
		clones = [];
		buttons = [];
		solidswitches = [];
		
		var fast = new Fast(level.firstElement());
		
		levelWidth = Std.parseInt(fast.att.width);
		levelHeight = Std.parseInt(fast.att.height);
		
		bMode = Std.parseInt(fast.att.bmode);
		buttonPrevState = "";
		
		if(fast.att.switchstart == "true")
		{
			switchStart = true;
		}
		else
		{
			switchStart = false;
		}
		
		clonesNeeded = Std.parseInt(fast.att.needed);
		clonesSaved = 0;
		
		for(c in fast.nodes.Clone)
		{
			beginX = Std.parseInt(c.att.x);
			beginY = Std.parseInt(c.att.y);
			var clone:Player = new Player(true, 0, beginX, beginY);
			clones.push(clone);
			activeClone = clone;
			add(clone);
		}
		for(s in fast.nodes.Solid)
		{
			add(new Solid(Std.parseInt(s.att.x), Std.parseInt(s.att.y)));
		}
		for(sw in fast.nodes.SolidSwitch)
		{
			var sswitch = new SolidSwitch(sw.att.active, Std.parseInt(sw.att.x), Std.parseInt(sw.att.y));
			solidswitches.push(sswitch);
			add(sswitch);
		}
		for(b in fast.nodes.Button)
		{
			var button:Button = new Button(Std.parseInt(b.att.x), Std.parseInt(b.att.y));
			buttons.push(button);
			add(button);
		}
		for(g in fast.nodes.Goal)
		{
			goal = new Goal(Std.parseInt(g.att.x), Std.parseInt(g.att.y));
			add(goal);
		}
		
		clonesText = new Text("Clones: " + clones.length + " / 6", 0, 0, Std.int(HXP.screen.width * .3), 50);
		clonesText.size = 26;
		clonesText.color = 0xf0dd00;
		clonesText.x = HXP.screen.width * .2;
		clonesText.y = 5;
		clonesText.scrollX = clonesText.scrollY = 0;
		addGraphic(clonesText);
		
		savedText = new Text("Saved: " + clonesSaved + " / " + clonesNeeded, 0, 0, Std.int(HXP.screen.width * .3), 50);
		savedText.size = 26;
		savedText.color = 0xffee00;
		savedText.x = HXP.screen.width * .5;
		savedText.y = 5;
		savedText.scrollX = savedText.scrollY = 0;
		addGraphic(savedText);
	}
	
	override public function update():Void
	{
		super.update();
		
		updateCamera();
		//keep camera in bounds
		if(HXP.camera.x < 0)
		{
			HXP.camera.x = 0;
		}
		else if(HXP.camera.x + HXP.width > levelWidth)
		{
			HXP.camera.x = levelWidth - HXP.width;
		}
		if(HXP.camera.y < 0)
		{
			HXP.camera.y = 0;
		}
		else if(HXP.camera.y + HXP.height > levelHeight)
		{
			HXP.camera.y = levelHeight - HXP.height;
		}
		
		//get input to switch clones or create one
		if(Input.pressed(Key.DIGIT_1) || Input.pressed(Key.DIGIT_2) || Input.pressed(Key.DIGIT_3) || Input.pressed(Key.DIGIT_4) || Input.pressed(Key.DIGIT_5) || Input.pressed(Key.DIGIT_6))
		{
			if(clones[Input.lastKey - 49] == null)
			{
				G.cloneSnd.play();
				newClone();
				clonesText.text = "Clones: " + clones.length + " / 6";
			}
			else
			{
				changeActive(activeClone.index, Input.lastKey - 49);
			}
		}
		
		//do some checks and stuff on the clones
		for(i in clones)
		{
			checkToRespawn(i);
		}
		
		checkButtons();
		
		clonesSaved = getClonesSaved();
		savedText.text = "Saved: " + clonesSaved + " / " + clonesNeeded;
		
		if(Input.pressed(Key.ENTER) && clonesSaved >= clonesNeeded)
		{
			G.teleportSnd.play();
			HXP.world.removeAll();
			HXP.world = new PlayWorld(Levels.levelArray[Levels.curLevel]);
		}
	}
	
	public function newClone():Void
	{
		for(i in clones)
		{
			i.changeActiveState(false);
			i.layer = 100;
		}
		var newClone:Player = new Player(true, clones.length, Std.int(activeClone.x), Std.int(activeClone.y));
		newClone.layer = 10;
		clones.push(newClone);
		add(newClone);
		activeClone = newClone;
	}
	
	public function changeActive(oldIndex:Int, newIndex:Int):Void
	{
		clones[oldIndex].changeActiveState(false);
		clones[oldIndex].layer = 100;
		clones[newIndex].changeActiveState(true);
		clones[newIndex].layer = 10;
		activeClone = clones[newIndex];
	}
	
	public function checkToRespawn(clone:Player)
	{
		if(clone.y > levelHeight)
		{
			G.hurtSnd.play();
			clone.x = beginX;
			clone.y = beginY;
		}
	}
	
	public function getClonesSaved():Int
	{
		var collides:Array<Entity> = [];
		goal.collideInto("clone", goal.x, goal.y - 1, collides);
		return collides.length;
	}
	
	public function checkButtons()
	{
		if(buttons.length > 0 && bMode == 0)
		{
			for(b in buttons)
			{
				if(b.activated && Std.string(b.activated) != buttonPrevState)
				{
					for(s in solidswitches)
					{
						s.changeState(!switchStart);
					}
					buttonPrevState = Std.string(b.activated);
					break;
				}
				else if(Std.string(b.activated) != buttonPrevState)
				{
					for(s in solidswitches)
					{
						s.changeState(switchStart);
					}
					buttonPrevState = Std.string(b.activated);
				}
			}
		}
	}
	
	public function updateCamera():Void
	{
		//center camera on active clone
		HXP.camera.x = (activeClone.x + activeClone.halfWidth) - (HXP.width * .5);
		HXP.camera.y = (activeClone.y + activeClone.halfHeight) - (HXP.height * .5);
	}
}