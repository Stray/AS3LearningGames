package learninggames.model {
	
	import learninggames.model.OptionGame;
	import flash.display.Sprite;
	import learninggames.model.OptionWithConsequence;
	import learninggames.view.GamePiece;
	
	public class OptionGameBuilder {
		
		protected var _optionsVector:Vector.<OptionWithConsequence>;
		protected var _submitButton:Sprite;
		protected var _multipleSelection:Boolean;
		
		public function OptionGameBuilder() {
			init();
		}  
		
		public function addOptionWithConsequence(optionButton:Sprite, consequence:Function):OptionGameBuilder
		{
			var optionWithConsequence:OptionWithConsequence = new OptionWithConsequence(new GamePiece(optionButton), consequence);
			optionsVector.push(optionWithConsequence);
			return this;
		}
		
		public function addSubmitButton(submitButton:Sprite):OptionGameBuilder
		{
			_submitButton = submitButton;
			return this;
		}
		
		public function allowMultipleSelection():OptionGameBuilder
		{
			_multipleSelection = true;
			return this;
		}               
		
		public function build():OptionGame
		{
			return new OptionGame(optionsVector, _submitButton, _multipleSelection);
		}
		
		protected function get optionsVector():Vector.<OptionWithConsequence>
		{
			return _optionsVector ||= new Vector.<OptionWithConsequence>();
		}
		
		protected function init():void
		{
			_multipleSelection = false;
		}
		
	}
}