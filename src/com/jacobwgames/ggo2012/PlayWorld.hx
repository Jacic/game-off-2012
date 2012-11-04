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
		var solid:Solid = new Solid();
		solid.x = 10;
		solid.y = 500;
		add(solid);
	}
	
	override public function update():Void
	{
		super.update();
	}
}