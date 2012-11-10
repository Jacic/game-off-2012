package com.jacobwgames.ggo2012;

import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.World;
import com.haxepunk.HXP;
import haxe.xml.Fast;

/**
 * ...
 * @author Jacic
 */

class PlayWorld extends World
{
	private var maxLevelWidth:Int;
	private var maxLevelHeight:Int;
	private var beginX:Int;
	private var beginY:Int;
	private var clones:Array<Player>;
	private var activeClone:Player;
	
	public function new(level:Xml) 
	{
		super();
		
		maxLevelWidth = 2560;
		maxLevelHeight = 1920;
		
		clones = [];
		
		var fast = new Fast(level.firstElement());
		
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
		else if(HXP.camera.x + HXP.width > maxLevelWidth)
		{
			HXP.camera.x = maxLevelWidth - HXP.width;
		}
		if(HXP.camera.y < 0)
		{
			HXP.camera.y = 0;
		}
		else if(HXP.camera.y + HXP.height > maxLevelHeight)
		{
			HXP.camera.y = maxLevelHeight - HXP.height;
		}
		
		//get input to switch clones or create one
		if(Input.pressed(Key.DIGIT_1) || Input.pressed(Key.DIGIT_2) || Input.pressed(Key.DIGIT_3) || Input.pressed(Key.DIGIT_4) || Input.pressed(Key.DIGIT_5) || Input.pressed(Key.DIGIT_6))
		{
			if(clones[Input.lastKey - 49] == null)
			{
				newClone();
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
	}
	
	public function newClone():Void
	{
		for(i in clones)
		{
			i.isActive = false;
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
		clones[oldIndex].isActive = false;
		clones[oldIndex].layer = 100;
		clones[newIndex].isActive = true;
		clones[newIndex].layer = 10;
		activeClone = clones[newIndex];
	}
	
	public function checkToRespawn(clone:Player)
	{
		if(clone.y > maxLevelHeight)
		{
			clone.x = beginX;
			clone.y = beginY;
		}
	}
	
	public function updateCamera():Void
	{
		//center camera on active clone
		HXP.camera.x = (activeClone.x + activeClone.halfWidth) - (HXP.width * .5);
		HXP.camera.y = (activeClone.y + activeClone.halfHeight) - (HXP.height * .5);
	}
}