package view
{
	import event.ViewEvent;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import model.Model;
	
	import utils.StageReference;

	public class View extends EventDispatcher
	{
		private var _m:Model;
		
		private var _root:Sprite;	
		
		private var _loginView:LoginView;
		
		public function View(m:Model)
		{
			_m = m;
			
			_root = new Sprite();
			//_root.visible = false; //默认隐藏
			_root.name = 'root';
			
			StageReference.stage.addChildAt(_root, 0);
		}
		
		public function setupView():void
		{			
			_loginView = new LoginView(_m);
			_loginView.addEventListener(ViewEvent.LOGIN, function(evt:ViewEvent):void{ dispatchEvent(evt); });
			_root.addChild(_loginView);
			
			
			
			StageReference.stage.dispatchEvent(new Event(Event.RESIZE));
		}
	}
}