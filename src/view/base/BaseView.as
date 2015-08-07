package view.base
{
	import event.ModelEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import model.Model;
	
	import utils.StageReference;
	
	public class BaseView extends Sprite
	{
		private var _m:Model;
		
		/** 是否需要重绘界面  **/
		private var _updateFlag:Boolean = false;
		
		public function BaseView(m:Model)
		{
			super();
			
			_m = m;
			
			addListeners();
		}
		
		protected function addListeners():void
		{
			_m.addEventListener(ModelEvent.UNABLE_TO_LOGIN, onUnableToLogin);
			_m.addEventListener(ModelEvent.LOGGED_IN, onLoggedIn);
			StageReference.stage.addEventListener(Event.RESIZE,onResize);
			StageReference.stage.addEventListener(Event.RENDER, onRender);
		}
		
		protected function onUnableToLogin(evt:ModelEvent):void
		{
			
		}
		
		protected function onLoggedIn(evt:ModelEvent):void
		{
			
		}
		
		private function onResize(evt:Event):void
		{
			_updateFlag = true;
			StageReference.stage.invalidate();
		}
		
		/** Event.RENDER在FP更新显示列表前触发 **/
		private function onRender(evt:Event):void
		{
			if(_updateFlag)
			{
				render();
				_updateFlag = false;
			}
		}
		
		/**
		 * 交给子类重写, 实现自定义调整尺寸和布局 
		 * 
		 */		
		protected function render():void
		{
			
		}		
		/**
		 * 舞台宽度 
		 * @return 
		 * 
		 */		
		protected function get stageWidth():Number
		{
			return StageReference.stage.stageWidth;
		}
		
		/**
		 * 舞台高度 
		 * @return 
		 * 
		 */		
		protected function get stageHeight():Number
		{
			return StageReference.stage.stageHeight;
		}
	}
}