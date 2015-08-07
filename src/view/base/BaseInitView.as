package view.base
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Capabilities;
	import flash.system.IME;
	
	/**
	 * 初始化基类 
	 * @author dw_yangqiao
	 * 
	 */	
	public class BaseInitView extends Sprite
	{
		public function BaseInitView()
		{
			super();
			
			stage ? init() : this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		protected function onAddedToStage(evt:Event):void			
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			init();
		}
		
	    protected function init():void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.BEST;
			Capabilities.hasIME && (IME.enabled = false); //防止输入法对键盘事件的影响
		}
	}
}