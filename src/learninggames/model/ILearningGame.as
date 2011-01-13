package learninggames.model 
{
	import flash.display.DisplayObject;

	public interface ILearningGame 
	{
		function endGame():void;
		
		function reset():void;
		
		function replaceSkins(pieces:Vector.<DisplayObject>):void;
	}   
	
}