package com.jacobwgames.ggo2012;

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
	private var clones:Array<Player>;
	private var activeClone:Player;
	
	public function new(level:Xml) 
	{
		super();
		
		levelWidth = 2560;
		levelHeight = 1920;
		
		clones = [];
		
		var fast = new Fast(level.firstElement());
		
		for(c in fast.nodes.clone)
		{
			beginX = Std.parseInt(c.att.x);
			beginY = Std.parseInt(c.att.y);
			var clone:Player = new Player(true, beginX, beginY);
			clones.push(clone);
			activeClone = clone;
			add(clone);
		}
		for(s in fast.nodes.solid)
		{
			add(new Solid(Std.parseInt(s.att.x), Std.parseInt(s.att.y)));
		}
		
		//focus camera on first clone
		HXP.camera.x = (activeClone.x - activeClone.halfWidth) - (HXP.width * .5);
		HXP.camera.y = (activeClone.y - activeClone.halfHeight) - (HXP.height * .5);
	}
	
	override public function update():Void
	{
		super.update();
		
		//center camera on active clone
		HXP.camera.x = (activeClone.x - activeClone.halfWidth) - (HXP.width * .5);
		HXP.camera.y = (activeClone.y - activeClone.halfHeight) - (HXP.height * .5);
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
		
		//do some checks and stuff on the clones
		for(i in clones)
		{
			checkToRespawn(i);
		}
	}
	
	public function changeActive(oldIndex:Int, newIndex:Int):Void
	{
		clones[oldIndex].isActive = false;
		clones[newIndex].isActive = true;
		activeClone = clones[newIndex];
	}
	
	public function checkToRespawn(clone:Player)
	{
		if(clone.y > levelHeight)
		{
			clone.x = beginX;
			clone.y = beginY;
		}
	}
}