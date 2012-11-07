package com.jacobwgames.ggo2012;

import com.haxepunk.World;

/**
 * ...
 * @author Jacic
 */

class PlayWorld extends World
{
	private var levelWidth:Int;
	private var levelHeight:Int;
	private var clones:Array<Player>;
	private var activeClone:Player;
	
	public function new(level:Xml) 
	{
		super();
		
		levelWidth = 2560;
		levelWidth = 1920;
		
		clones = [];
		
		var fast = new Fast(level.firstElement());
		
		for(c in fast.nodes.clone)
		{
			var clone:Player = new Player(true, Std.parseInt(c.att.x), Std.parseInt(c.att.y));
			clones.push(clone);
			active = clone;
			add(clone);
		}
		for(s in fast.nodes.solid)
		{
			add(new Solid(Std.parseInt(s.att.x), Std.parseInt(s.att.y)));
		}
	}
	
	override public function update():Void
	{
		super.update();
		
	}
	
	public function changeActive(oldIndex:Int, newIndex:Int):Void
	{
		clones[oldIndex].isActive = false;
		clones[newIndex].isActive = true;
		activeClone = clones[newIndex];
	}
}