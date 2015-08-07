package
{
	import controller.Controller;
	
	import flash.display.Sprite;
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	import flash.ui.Mouse;
	
	import model.Model;
	
	import utils.StageReference;
	
	import view.View;
	import view.base.BaseInitView;
	
	public class P2PMobileDemo extends BaseInitView
	{
		private var _m:Model;
		private var _v:View;
		private var _c:Controller;		
		
		public function P2PMobileDemo()
		{
			super();
		}
		
		override protected function init():void
		{
			super.init();
			
			new StageReference(this);			
			
			_m = new Model();
			_v = new View(_m);			
			_c = new Controller(_v, _m);	
			
			_c.setupPlayer();
			
			
		}
	}
}