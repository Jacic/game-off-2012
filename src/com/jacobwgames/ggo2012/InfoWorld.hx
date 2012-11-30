package com.jacobwgames.ggo2012;

import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.World;
import com.haxepunk.HXP;

/**
 * ...
 * @author Jacic
 */

class InfoWorld extends World
{
	private var backBtnClear:Image;
	private var backBtnBlur:Image;
	private var infoText:Text;
	private var controlsText:Text;
	private var creditsText:Text;
	
	public function new() 
	{
		super();
		
		backBtnClear = new Image("gfx/backbtnclear.png");
		backBtnBlur = new Image("gfx/backbtnblur.png");
		
		backBtnBlur.x = 90 - (backBtnBlur.width * .5);
		backBtnBlur.y = 20;
		addGraphic(backBtnBlur);
		backBtnClear.scale = 1.25;
		backBtnClear.x = 90 - (backBtnClear.scaledWidth * .5);
		backBtnClear.y = 20;
		backBtnClear.visible = false;
		addGraphic(backBtnClear);
		
		infoText = new Text("When scientists cloned the newly discovered alien\nhumanoids, they never suspected that the clones might\nnot want to take part in experiments.\nAll the clones want is to go home.\nGuide the clones to the teleporter in each area to escape.", 0, 0, 780, 400);
		infoText.size = 24;
		addGraphic(infoText, 0, Std.int(400 - (infoText.width * .5)), 100);
		controlsText = new Text("Controls:\n-Arrow keys or WASD keys to move and jump\n-Keys 1-6 spawn a new clone and will switch between clones\n-Press R to restart a level\n-Press Enter when enough clones have reached a\n  teleporter to activate it", 0, 0, 780, 250);
		controlsText.size = 24;
		addGraphic(controlsText, 0, Std.int(400 - (controlsText.width * .5)), 300);
		creditsText = new Text("Created by Jacob \"Jacic\" White\njacobwgames@gmail.com\nhttps://twitter.com/IamJacic\nhttps://jacobwgames.wordpress.com/", 0, 0, 500, 200);
		creditsText.size = 24;
		addGraphic(creditsText, 0, Std.int(400 - (creditsText.width * .5)), 520);
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