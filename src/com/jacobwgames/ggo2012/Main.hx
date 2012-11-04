package com.jacobwgames.ggo2012;

import com.haxepunk.Engine;
import com.haxepunk.HXP;

/**
 * ...
 * @author Jacic
 */

class Main extends Engine 
{

	public static inline var kScreenWidth:Int = 800;
	public static inline var kScreenHeight:Int = 640;
	public static inline var kFrameRate:Int = 60;
	public static inline var kClearColor:Int = 0x0099ff;
	public static inline var kProjectName:String = "GGO2012";

	function new()
	{
		super(kScreenWidth, kScreenHeight, kFrameRate, false);
	}
	
	override public function init()
	{
#if debug
	#if flash
		if (flash.system.Capabilities.isDebugger)
	#end
		{
			HXP.console.enable();
		}
#end
		HXP.screen.color = kClearColor;
		HXP.screen.scale = 1;
		HXP.world = new PlayWorld();
	}

	public static function main()
	{
		var app = new Main();
	}
}