package com.jacobwgames.ggo2012;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Jacic
 */

class SolidSwitch extends Entity
{
	
	public function new(act:String, xx:Int, yy:Int) 
	{
		super();
		
		graphic = new Image("gfx/solidswitch.png");
		setHitbox(32, 32);
		changeState(act == "true");
		
		x = xx;
		y = yy;
	}
	
	public function changeState(act:Bool)
	{
		if(act)
		{
			type = "solid";
			graphic.visible = true;
		}
		else
		{
			type = "off";
			graphic.visible = false;
		}
	}
}