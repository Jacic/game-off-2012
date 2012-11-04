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
	private var vy:Float;
	private var maxVertSpeed:Int;
	private var jumpsLeft:Int;
	private var isOnGround:Bool;
	
	public function new(act:Bool) 
	{
		super();
		
		isActive = act;
		image = new Image("gfx/clone.png");
		graphic = image;
		
		setHitbox(96, 128);
		type = "clone";
		speed = 120;
		vy = .1;
		maxVertSpeed = 20;
		jumpsLeft = 1;
		
		//set up controls
		Input.define("up", [Key.W, Key.UP]);
		Input.define("down", [Key.S, Key.DOWN]);
		Input.define("left", [Key.A, Key.LEFT]);
		Input.define("right", [Key.D, Key.RIGHT]);
	}
	
	override public function update():Void
	{
		var plusX:Float = 0;
		
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
			
			if(Input.pressed("up") && collide("solid", x, y + 1) != null && jumpsLeft > 0)
			{
				jumpsLeft -= 1;
				vy = -(maxVertSpeed * .75);
			}
		}
		
		var colsolid = collide("solid", x, y + vy);
		if(plusX != 0 && colsolid == null)
		{
			//nothing in the way
			x += plusX;
		}
		else if(plusX != 0)
		{
			//a solid object in the way
			if(plusX > 0)
			{
				x = colsolid.x - image.scaledWidth;
			}
			else
			{
				x = colsolid.x + colsolid.width;
			}
			plusX = 0;
		}
		
		colsolid = collide("solid", x, y + vy);
		if(vy != 0 && colsolid == null)
		{
			//nothing in the way
			y += HXP.sign(vy);
		}
		else if(vy != 0)
		{
			//a solid object int the way
			if(vy > 0)
			{
				y = colsolid.y - image.scaledHeight;
			}
			else
			{
				y = colsolid.y + colsolid.height;
			}
			vy = 0;
		}
		
		if(vy != 0)
		{
			vy += HXP.elapsed * 10;
			if(vy > maxVertSpeed)
			{
				vy = maxVertSpeed;
			}
		}
		
		x += plusX;
	}
}