package com.jacobwgames.ggo2012;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Jacic
 */

class Solid extends Entity
{
	
	public function new() 
	{
		super();
		
		graphic = new Image("gfx/solid.png");
		setHitbox(64, 64);
		type = "solid";
	}
	
}