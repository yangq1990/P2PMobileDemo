package event
{
	import flash.events.Event;
	
	public class ViewEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		public function ViewEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event
		{
			return new ViewEvent(type);
		}
	}
}