package event
{
	import flash.events.Event;
	
	public class ModelEvent extends Event
	{
		public static const UNABLE_TO_LOGIN:String = "unable_to_login";
		
		public static const LOGGED_IN:String = "logged_in";
		
		public var msg:String;
		
		public function ModelEvent(type:String, msg:String="", bubbles:Boolean=false, cancelable:Boolean=false)
		{
			this.msg = msg;
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ModelEvent(type, msg);
		}
	}
}