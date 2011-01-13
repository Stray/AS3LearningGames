package learninggames.model {
	
	import learninggames.view.GamePiece;
	
	public class OptionWithConsequence {
		
		protected var _consequence:Function;
		
		public function OptionWithConsequence(optionButton:GamePiece, consequence:Function) {
			_consequence = consequence;
			_optionButton = optionButton;
		}
		
		protected var _optionButton:GamePiece;

		public function get optionButton():GamePiece
		{
			return _optionButton;
		} 
		
		public function execute():void
		{
			_consequence();
		}
		 
	}
}