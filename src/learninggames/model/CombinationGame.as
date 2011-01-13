package learninggames.model {

	import org.osflash.signals.Signal;
	import flash.events.MouseEvent;
	import learninggames.view.GamePiece;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import flash.display.InteractiveObject;
	import flash.display.DisplayObject;
	
	public class CombinationGame implements ILearningGame {
		
		protected var _gamePieces:Vector.<GamePiece>;
		protected var _combinationRuleSets:Vector.<CombinationRuleSet>;
		protected var _submitButton:InteractiveObject;  
		protected var _buttonsBySkinName:Dictionary;
		
		protected var _completedSignal:Signal;
		protected var _failedSignal:Signal;

		public function CombinationGame(combinationRuleSets:Vector.<CombinationRuleSet>, gamePieces:Vector.<GamePiece>, submitButton:InteractiveObject) {
			_combinationRuleSets = combinationRuleSets;
			_gamePieces = gamePieces;
			wireSubmit(submitButton);
			captureOptionButtons();
		}
		
		//---------------------------------------
		// ILearningGame Implementation
		//---------------------------------------

		//import learninggames.model.ILearningGame;
		public function endGame():void
		{
			for each (var gamePiece:* in buttonsBySkinName)
			{
				(gamePiece as GamePiece).active = false;
			}
			unwireSubmit();
  		}
		
		public function reset():void
		{
			for each (var gamePiece:* in buttonsBySkinName)
			{
				(gamePiece as GamePiece).reset();
			}
			wireSubmit(_submitButton);
		}   
		
		public function replaceSkins(pieces:Vector.<DisplayObject>):void
		{
			var iLength:uint = pieces.length;
			for (var i:int = 0; i < iLength; i++)
			{
				if(_submitButton.name == pieces[i].name)
				{
					wireSubmit(pieces[i] as InteractiveObject);
				}
				else if(buttonsBySkinName[pieces[i].name] != null)
				{
					buttonsBySkinName[pieces[i].name].replaceSkin(pieces[i] as Sprite);
				}
			}
		}

		public function get completedSignal():Signal
		{
			return _completedSignal ||= new Signal();
		} 

		public function get failedSignal():Signal
		{
			return _failedSignal ||= new Signal();
		}

        public function get selectedItems():Vector.<Sprite>
		{
			var selectedItemsVector:Vector.<Sprite> = new Vector.<Sprite>();
			for each (var gamePiece:* in buttonsBySkinName)
			{
				if((gamePiece as GamePiece).selected)
				{
					selectedItemsVector.push((gamePiece as GamePiece).skin)
				}
			}
			return selectedItemsVector;
		}
		
		protected function get buttonsBySkinName():Dictionary
		{
			return _buttonsBySkinName ||= new Dictionary();
		}
		
	    protected function wireSubmit(submitButton:InteractiveObject):void
		{
			unwireSubmit();
			trace("wiring submit: " + submitButton);
			_submitButton = submitButton;
			_submitButton.addEventListener(MouseEvent.CLICK, processSubmit);
		}
		
		protected function unwireSubmit():void
		{
			if((_submitButton != null) && (_submitButton.hasEventListener(MouseEvent.CLICK)))
			{
				_submitButton.removeEventListener(MouseEvent.CLICK, processSubmit);
			}
		}
		
		protected function captureOptionButtons():void
		{
			var iLength:uint = _gamePieces.length;
			for (var i:int = 0; i < iLength; i++)
			{
				var optionButton:GamePiece = _gamePieces[i];
				buttonsBySkinName[optionButton.skinName] = optionButton;
			}
		}                                                                  
		
		protected function processSubmit(e:MouseEvent):void
		{
			trace("CombinationGame::processSubmit()");
			var iLength:uint = _combinationRuleSets.length;
			for (var i:int = 0; i < iLength; i++)
			{
				if(_combinationRuleSets[i].valid === false)
				{
					_failedSignal.dispatch();
					return;
				}
			}
			
			_completedSignal.dispatch();
		}   
		
	}
}