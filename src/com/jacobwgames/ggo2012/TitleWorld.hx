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

class TitleWorld extends World
{
	private var title:Image;
	private var playBtnClear:Image;
	private var playBtnBlur:Image;
	private var infoBtnClear:Image;
	private var infoBtnBlur:Image;
	
	public function new() 
	{
		super();
		
		title = new Image("gfx/title.png");
		title.x = 400 - (title.width * .5);
		title.y = 10;
		addGraphic(title);
		
		playBtnClear = new Image("gfx/playbtnclear.png");
		playBtnBlur = new Image("gfx/playbtnblur.png");
		
		playBtnBlur.x = 400 - (playBtnBlur.width * .5);
		playBtnBlur.y = 350;
		addGraphic(playBtnBlur);
		playBtnClear.scale = 1.25;
		playBtnClear.x = 400 - (playBtnClear.scaledWidth * .5);
		playBtnClear.y = 350;
		playBtnClear.visible = false;
		addGraphic(playBtnClear);
		
		infoBtnClear = new Image("gfx/infobtnclear.png");
		infoBtnBlur = new Image("gfx/infobtnblur.png");
		
		infoBtnBlur.x = 400 - (infoBtnBlur.width * .5);
		infoBtnBlur.y = 450;
		addGraphic(infoBtnBlur);
		infoBtnClear.scale = 1.25;
		infoBtnClear.x = 400 - (infoBtnClear.scaledWidth * .5);
		infoBtnClear.y = 450;
		infoBtnClear.visible = false;
		addGraphic(infoBtnClear);
		
		var cloneR:Spritemap = new Spritemap("gfx/cloneright.png", 96, 128);
		cloneR.add("right", [0]);
		addGraphic(cloneR, HXP.BASELAYER, 20, Std.int(HXP.screen.height * .5));
		cloneR.play("right");
		var cloneL:Spritemap = new Spritemap("gfx/cloneleft.png", 96, 128);
		cloneL.add("left", [0]);
		addGraphic(cloneL, HXP.BASELAYER, (780 - cloneL.width), Std.int(HXP.screen.height * .5));
		cloneL.play("left");
	}
	
	override public function update():Void
	{
		super.update();
		
		if(Input.mouseX >= playBtnBlur.x && Input.mouseX <= playBtnBlur.x + playBtnBlur.width && Input.mouseY >= playBtnBlur.y && Input.mouseY <= playBtnBlur.y + playBtnBlur.height)
		{
			playBtnBlur.visible = false;
			playBtnClear.visible = true;
			if(Input.mousePressed)
			{
				HXP.world.removeAll();
				HXP.world = new PlayWorld(Levels.levelArray[0]);
			}
		}
		else
		{
			playBtnClear.visible = false;
			playBtnBlur.visible = true;
		}
		
		if(Input.mouseX >= infoBtnBlur.x && Input.mouseX <= infoBtnBlur.x + infoBtnBlur.width && Input.mouseY >= infoBtnBlur.y && Input.mouseY <= infoBtnBlur.y + infoBtnBlur.height)
		{
			infoBtnBlur.visible = false;
			infoBtnClear.visible = true;
			if(Input.mousePressed)
			{
				HXP.world.removeAll();
				HXP.world = new InfoWorld();
			}
		}
		else
		{
			infoBtnClear.visible = false;
			infoBtnBlur.visible = true;
		}
	}
}