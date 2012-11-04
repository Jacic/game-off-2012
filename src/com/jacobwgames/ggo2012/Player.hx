package com.jacobwgames.ggo2012;

import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

/**
 * ...
 * @author Jacic
 */

class Player extends Entity
{
	private var isActive:Bool;
	private var image:Image;
	private var speed:Int;
	
	public function new(act:Bool) 
	{
		super();
		
		isActive = act;
		image = new Image("gfx/clone.png");
		graphic = image;
		
		speed = 120;
		
		//set up controls
		Input.define("up", [Key.W, Key.UP]);
		Input.define("down", [Key.S, Key.DOWN]);
		Input.define("left", [Key.A, Key.LEFT]);
		Input.define("right", [Key.D, Key.RIGHT]);
	}
	
	override public function update():Void
	{
		var plusX:Float = 0;
		var plusY:Float = 0;
		
		if(isActive)
		{
			if(Input.check("left"))
			{
				plusX -= speed * HXP.elapsed;
			}
			if(Input.check("right"))
			{
				plusX += speed * HXP.elapsed;
			}
			
			x += plusX;
			y += plusY;
		}
	}
}