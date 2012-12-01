package com.jacobwgames.ggo2012;

import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.World;
import com.haxepunk.HXP;

/**
 * ...
 * @author Jacic
 */

class EndWorld extends World
{
	private var backBtnClear:Image;
	private var backBtnBlur:Image;
	private var endImage:Image;
	
	public function new() 
	{
		super();
		
		backBtnClear = new Image("gfx/backbtnclear.png");
		backBtnBlur = new Image("gfx/backbtnblur.png");
		
		backBtnBlur.x = 400 - (backBtnBlur.width * .5);
		backBtnBlur.y = 560;
		addGraphic(backBtnBlur);
		backBtnClear.scale = 1.25;
		backBtnClear.x = 400 - (backBtnClear.scaledWidth * .5);
		backBtnClear.y = 560;
		backBtnClear.visible = false;
		addGraphic(backBtnClear);
		
		endImage = new Image("gfx/end.png");
		endImage.x = 400 - (endImage.width * .5);
		endImage.y = 50;
		addGraphic(endImage);
		
		var cloneR:Spritemap = new Spritemap("gfx/cloneright.png", 96, 128);
		cloneR.add("right", [0]);
		cloneR.play("right");
		var cloneL:Spritemap = new Spritemap("gfx/cloneleft.png", 96, 128);
		cloneL.add("left", [0]);
		cloneL.play("left");
		addGraphic(cloneL, HXP.BASELAYER, 640, Std.int(HXP.screen.height * .6));
		addGraphic(cloneR, HXP.BASELAYER, 40, Std.int(HXP.screen.height * .6));
		addGraphic(cloneR, HXP.BASELAYER, 190, Std.int(HXP.screen.height * .6));
		addGraphic(cloneL, HXP.BASELAYER, 320, Std.int(HXP.screen.height * .6));
		addGraphic(cloneR, HXP.BASELAYER, 440, Std.int(HXP.screen.height * .6));
		addGraphic(cloneL, HXP.BASELAYER, 540, Std.int(HXP.screen.height * .6));
		
	}
	
	override public function update():Void
	{
		super.update();
		
		if(Input.mouseX >= backBtnBlur.x && Input.mouseX <= backBtnBlur.x + backBtnBlur.width && Input.mouseY >= backBtnBlur.y && Input.mouseY <= backBtnBlur.y + backBtnBlur.height)
		{
			backBtnBlur.visible = false;
			backBtnClear.visible = true;
			if(Input.mousePressed)
			{
				HXP.world.removeAll();
				HXP.world = new TitleWorld();
			}
		}
		else
		{
			backBtnClear.visible = false;
			backBtnBlur.visible = true;
		}
	}
}