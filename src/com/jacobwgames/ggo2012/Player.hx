package com.jacobwgames.ggo2012;

import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

/**
 * ...
 * @author Jacic
 */

class Player extends Entity
{
	public var index:Int;
	private var isActive:Bool;
	private var imageR:Spritemap;
	private var imageL:Spritemap;
	private var speed:Int;
	private var vy:Float;
	private var gravity:Float;
	private var maxVertSpeed:Int;
	private var jumpsLeft:Int;
	private var isOnGround:Bool;
	
	public function new(act:Bool, ind:Int, xx:Int, yy:Int) 
	{
		super();
		
		isActive = act;
		index = ind;
		imageR = new Spritemap("gfx/cloneright.png", 96, 128);
		imageR.add("stand", [0], 0, false);
		imageR.add("walk", [0, 1, 3, 2, 2, 1], 10, true);
		imageL = new Spritemap("gfx/cloneleft.png", 96, 128);
		imageL.add("stand", [0], 0, false);
		imageL.add("walk", [0, 1, 3, 2, 2, 1], 10, true);
		graphic = imageR;
		imageR.play("stand");
		layer = 10;
		
		x = xx;
		y = yy;
		
		setHitbox(96, 128);
		type = "clone";
		speed = 200;
		vy = .1;
		gravity = .2;
		maxVertSpeed = 15;
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
				graphic = imageL;
				imageL.play("walk");
			}
			else if(Input.released("left"))
			{
				imageL.play("stand");
			}
			if(Input.check("right"))
			{
				plusX += speed * HXP.elapsed;
				graphic = imageR;
				imageR.play("walk");
			}
			else if(Input.released("right"))
			{
				imageR.play("stand");
			}
			
			if(Input.pressed("up") && collide("solid", x, y + 1) != null)
			{
				jumpsLeft -= 1;
				vy = -(maxVertSpeed * .6);
			}
		}
		
		if(!Input.check("up") && vy < 0)
		{
			vy += gravity;
		}
		
		vy += gravity;
		
		if(vy != 0)
		{
			if(vy > maxVertSpeed)
			{
				vy = maxVertSpeed;
			}
			else if(vy < -maxVertSpeed)
			{
				vy = -maxVertSpeed;
			}
		}
		
		var colsolid = collide("solid", x + plusX, y);
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
				x = colsolid.x - width;
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
			y += vy;
		}
		else if(vy != 0)
		{
			//a solid object int the way
			if(vy > 0)
			{
				y = colsolid.y - height;
			}
			else
			{
				y = colsolid.y + colsolid.height;
			}
			vy = 0;
		}
	}
	
	public function changeActiveState(act:Bool):Void
	{
		isActive = act;
		if(!isActive)
		{
			if(graphic == imageL)
			{
				imageL.play("stand");
			}
			else
			{
				imageR.play("stand");
			}
		}
	}
}