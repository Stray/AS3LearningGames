package learninggames.view
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class ToggleGamePiece extends GamePiece
	{
	
		public function ToggleGamePiece(skin:Sprite)
		{
			super(skin);
		}
		
		override protected function pickUpClick(e:MouseEvent):void
		{
			toggleSelection();
			super.pickUpClick(e);
		}
		
		
	
	}

}