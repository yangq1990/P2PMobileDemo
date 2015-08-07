package model
{
	import consts.ConnectionStatus;
	
	import event.ModelEvent;
	
	import flash.events.AsyncErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.NetConnection;
	
	public class Model extends EventDispatcher
	{
		private var _nc:NetConnection;
		
		public function Model(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function login():void
		{
			_nc = new NetConnection();
			_nc.client = this;
			_nc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, errorHandler);
			_nc.addEventListener(SecurityErrorEvent.SECURITY_ERROR, errorHandler);
			_nc.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			_nc.addEventListener(NetStatusEvent.NET_STATUS, statusHandler);
			_nc.connect("rtmfp://106.184.3.231/p2p");
		}
		
		protected function errorHandler(evt:Event):void
		{
			dispatchEvent(new ModelEvent(ModelEvent.UNABLE_TO_LOGIN, evt.toString()));
		}
		
		/** 状态处理函数 **/
		protected function statusHandler(evt:NetStatusEvent):void
		{
			switch(evt.info.code)
			{
				case ConnectionStatus.SUCCESS:
					dispatchEvent(new ModelEvent(ModelEvent.LOGGED_IN));
					break;
				case ConnectionStatus.REJECTED:
				case ConnectionStatus.FAILED:
					dispatchEvent(new ModelEvent(ModelEvent.LOGGED_IN, evt.info.code));
					break;
				
			}
		}
		
		/*public function close():void
		{
			
		}*/
	}
}