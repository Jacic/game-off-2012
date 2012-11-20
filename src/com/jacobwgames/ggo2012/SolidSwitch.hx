package com.jacobwgames.ggo2012;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Jacic
 */

class SolidSwitch extends Entity
{
	
	public function new(act:Bool, xx:Int, yy:Int) 
	{
		super();
		
		graphic = new Image("gfx/solidswitch.png");
		setHitbox(64, 64);
		changeState(act);
		
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