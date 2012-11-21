package com.jacobwgames.ggo2012;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;

/**
 * ...
 * @author Jacic
 */

class Button extends Entity
{
	public var activated:Bool;
	private var image:Spritemap;
	
	public function new(xx:Int, yy:Int) 
	{
		super();
		
		image = new Spritemap("gfx/button.png", 64, 32);
		image.add("deactivated", [0], 0, false);
		image.add("activated", [1], 0, false);
		graphic = image;
		
		setHitbox(64, 23);
		
		activated = false;
		type = "solid";
		x = xx;
		y = yy;
	}
	
	override public function update()
	{
		if(collide("clone", x, y - 1) != null)
		{
			activated = true;
			image.play("activated");
		}
		else
		{
			activated = false;
			image.play("deactivated");
		}
	}
}