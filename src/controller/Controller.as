package controller
{
	import event.ViewEvent;
	
	import model.Model;
	
	import view.View;

	public class Controller
	{
		private var _v:View;
		private var _m:Model;
		
		public function Controller(v:View, m:Model)
		{
			_v = v;
			_m = m;
			
			addLitseners();
		}
		
		public function setupPlayer():void 
		{
			_v.setupView();
		}
		
		private function addLitseners():void
		{
			_v.addEventListener(ViewEvent.LOGIN, onLogin);
		}
		
		private function onLogin(evt:ViewEvent):void
		{
			_m.login();
		}
	}
}