package com.jacobwgames.ggo2012;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

/**
 * ...
 * @author Jacic
 */

class Player extends Entity
{
	private var active:Bool;
	private var image:Image;
	
	public function new(act:Bool) 
	{
		super();
		
		active = act;
		image = new Image("gfx/clone.png");
		graphic = image;
	}
	
}