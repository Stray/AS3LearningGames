package learninggames.model {
	
	import flash.display.Sprite;
	import learninggames.view.ISelectable;
	import learninggames.view.ToggleGamePiece;
	import learninggames.view.GamePiece;
	import flash.display.InteractiveObject;
	
	public class CombinationGameBuilder {
		 
		protected var _combinationRuleSets:Vector.<CombinationRuleSet>;
		
		protected var _gamePieces:Vector.<GamePiece>;
		
		protected var _submitButton:InteractiveObject;
		
		public function CombinationGameBuilder() {
		}
		
		public function requireOnlyOneOf(optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(1, 1, optionButtons);
		}
		
		public function requireOneOrMoreOf(optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(1, optionButtons.length, optionButtons);
		}
		
		public function requireAtLeastNOf(requiredNumber:uint, optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(requiredNumber, optionButtons.length, optionButtons);
		}               
		
		public function requireExactlyNOf(requiredNumber:uint, optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(requiredNumber, requiredNumber, optionButtons);
		}
		
		public function requireAnyOrNoneOf(optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(0, optionButtons.length, optionButtons);
		}
		
		public function requiredAtLeastAndNotMoreThan(atLeast:uint, notMoreThan:uint, optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			trace("requiredAtLeastAndNotMoreThan -> optionButtons: " + optionButtons);
			var createdGamePieces:Vector.<ISelectable> = createGamePiecesFrom(optionButtons);
			var ruleSet:CombinationRuleSet = new CombinationRuleSet(atLeast, notMoreThan, createdGamePieces);
			combinationRuleSets.push(ruleSet);
			return this;
		}               
		
		public function requireAllOf(optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(optionButtons.length, optionButtons.length, optionButtons);
		}               
		
		public function requireNoneOf(optionButtons:Vector.<Sprite>):CombinationGameBuilder
		{
			return requiredAtLeastAndNotMoreThan(0, 0, optionButtons);
		}
		
		public function addSubmitButton(submitBtn:InteractiveObject):CombinationGameBuilder
		{
			trace("CombinationGameBuilder::addSubmitButton()", submitBtn);
			_submitButton = submitBtn;
			return this;
		}               
		
		public function build():CombinationGame
		{
			return new CombinationGame(combinationRuleSets, gamePieces, submitButton);
		} 
		
		protected function createGamePiecesFrom(optionButtons:Vector.<Sprite>):Vector.<ISelectable>
		{
			var selectablePieces:Vector.<ISelectable> = new Vector.<ISelectable>();
			
			var iLength:uint = optionButtons.length;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextGamePiece:ToggleGamePiece = new ToggleGamePiece(optionButtons[i]);
				gamePieces.push(nextGamePiece);
				selectablePieces.push(nextGamePiece);
			}
			
			return selectablePieces;
		}   
		
		protected function get combinationRuleSets():Vector.<CombinationRuleSet>
		{
			return _combinationRuleSets ||= new Vector.<CombinationRuleSet>();
		}
		
		protected function get gamePieces():Vector.<GamePiece>
		{
			return _gamePieces ||= new Vector.<GamePiece>();
		}
		
		protected function get submitButton():InteractiveObject
		{
			return _submitButton ||= new Sprite();
		}
	}
}