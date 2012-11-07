package com.jacobwgames.ggo2012;

import com.haxepunk.World;
import haxe.xml.Fast;

/**
 * ...
 * @author Jacic
 */

class PlayWorld extends World
{
	private var levelWidth:Int;
	private var levelHeight:Int;
	private var clones:Array<Player>;
	
	public function new(level:Xml) 
	{
		super();
		
		levelWidth = 2000;
		levelWidth = 800;
		
		clones = [];
		
		var fast = new Fast(level.firstElement());
		
		for(c in fast.nodes.clone)
		{
			var clone:Player = new Player(true, Std.parseInt(c.att.x), Std.parseInt(c.att.y));
			clones.push(clone);
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
}