package view
{
	import event.ModelEvent;
	import event.ViewEvent;
	
	import fl.controls.Button;
	import fl.controls.TextInput;
	
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.text.TextField;
	
	import model.Model;
	
	import view.base.BaseView;
	
	public class LoginView extends BaseView
	{
		private var _label:TextField;
		
		private var _input:TextInput;
		
		private var _btn:Button;
		
		private var _log:TextField;
		
		public function LoginView(m:Model)
		{
			super(m);
			
			_label = new TextField();
			_label.text = "请输入用户名:";
			_label.width = stageWidth * 0.4;
			_label.height = stageHeight * 0.2;
			addChild(_label);
			
			_input = new TextInput();
			_input.width = stageWidth * 0.4;
			_input.height = stageHeight * 0.1;
			addChild(_input);
			
			_btn = new Button();
			_btn.width = stageWidth * 0.6;
			_btn.height = stageHeight * 0.1;			
			_btn.label = "登录";
			_btn.addEventListener(MouseEvent.CLICK, onTouchEnd);
			addChild(_btn);
			
			_log = new TextField();
			_log.width = stageWidth * 0.4;
			addChild(_log);
		}
		
		override protected function render():void
		{
			_btn.x = (stageWidth - _btn.width) * 0.5;
			_btn.y = (stageHeight - _btn.height) * 0.5;
			
			_label.x = (stageWidth - _label.width - _input.width - 10) * 0.5;
			_label.y = _btn.y - 10 - _label.height;
			
			_input.x = _label.x + _label.width + 10;
			_input.y = _label.y;
			
			_log.x = _label.x;
			_log.y = _btn.y + _btn.height + 10;
		}
		
		override protected function onLoggedIn(evt:ModelEvent):void
		{
			_log.text = "已成功连接服务器";
			
		}
		
		override protected function onUnableToLogin(evt:ModelEvent):void
		{
			_log.text = evt.msg;
		}
		
		private function onTouchEnd(evt:MouseEvent):void
		{
			dispatchEvent(new ViewEvent(ViewEvent.LOGIN));	
		}
	}
}