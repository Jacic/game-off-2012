package com.jacobwgames.ggo2012;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Jacic
 */

class Goal extends Entity
{
	
	public function new(xx:Int, yy:Int) 
	{
		super();
		
		graphic = new Image("gfx/goal.png");
		setHitbox(32, 64);
		type = "solid";
		
		x = xx;
		y = yy;
	}
	
}