package com.jacobwgames.ggo2012;

import com.haxepunk.World;

/**
 * ...
 * @author Jacic
 */

class PlayWorld extends World
{

	public function new() 
	{
		super();
		
		add(new Player(true));
	}
	
	override public function update():Void
	{
		super.update();
	}
}