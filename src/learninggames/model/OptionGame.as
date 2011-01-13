package learninggames.model {
	
	import flash.display.Sprite;
	import learninggames.model.OptionWithConsequence;
	import flash.utils.Dictionary;
	import learninggames.view.GamePiece;
	import flash.events.MouseEvent;
	
	public class OptionGame implements ILearningGame {
		
		protected var _multiOption:Boolean;
		
		protected var _optionsByButton:Dictionary;
		protected var _handlersByOptionButton:Dictionary;
		protected var _buttonsBySkinName:Dictionary;    
		protected var _submitButton:Sprite;
				
		public function OptionGame(options:Vector.<OptionWithConsequence>, submitButton:Sprite, multiOption:Boolean) {
			_multiOption = multiOption;   
			wireOptions(options);
			wireSubmit(submitButton);
		}
		
		public function endGame():void
		{
			for (var optionBtn:* in optionsByButton)
			{
				(optionBtn as GamePiece).active = false;
			    (optionBtn as GamePiece).removeEventListener(MouseEvent.CLICK, handlersByOptionButton[optionBtn]);
			}
  		}
		
		public function reset():void
		{
			for (var optionBtn:* in optionsByButton)
			{
				(optionBtn as GamePiece).reset();
				addButtonBehaviours(optionBtn as GamePiece);
			}
			
		}   
		
		public function replaceSkins(pieces:Vector.<Sprite>):void
		{
			var iLength:uint = pieces.length;
			for (var i:int = 0; i < iLength; i++)
			{
				if(_submitButton.name == pieces[i].name)
				{
					wireSubmit(pieces[i]);
				}
				else if(buttonsBySkinName[pieces[i].name] != null)
				{
					buttonsBySkinName[pieces[i].name].replaceSkin(pieces[i]);
				}
			}
		}
		

		public function get multiOption():Boolean
		{
			return _multiOption;
		} 
		
		/*
		
			PROTECTED
			
		*/
		
		protected function get optionsByButton():Dictionary
		{
			return _optionsByButton ||= new Dictionary();
		}  
		
		protected function get handlersByOptionButton():Dictionary
		{
			return _handlersByOptionButton ||= new Dictionary();
		}
		
		protected function get buttonsBySkinName():Dictionary
		{
			return _buttonsBySkinName ||= new Dictionary();
		}     
		
		
		protected function wireOptions(options:Vector.<OptionWithConsequence>):void
		{
			var iLength:uint = options.length;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextOption:OptionWithConsequence = options[i];
				var optionButton:GamePiece = nextOption.optionButton;
				optionsByButton[optionButton] = nextOption;
				buttonsBySkinName[optionButton.skinName] = optionButton;
				addButtonBehaviours(optionButton);
			}
		}                                         
		
		protected function addButtonBehaviours(optionButton:GamePiece):void
		{                                                          
			var handler:Function = createOptionClickedHandlerFor(optionButton);
			handlersByOptionButton[optionButton] = handler;
			optionButton.addEventListener(MouseEvent.CLICK, handler);
		}

		protected function createOptionClickedHandlerFor(optionButton:GamePiece):Function
		{
			var handler:Function;
			
		    if(_multiOption)
			{
				handler = function(e:MouseEvent):void
				{
					optionButton.toggleSelection();
				}
			}   
			else 
			{
				handler = function(e:MouseEvent):void
				{
					optionButton.toggleSelection();  
					clearOtherSelections(optionButton);
				}
			}          
			
			return handler;
		} 
		   
		protected function clearOtherSelections(optionButtonClicked:GamePiece):void
		{
			for (var optionBtn:* in optionsByButton)
			{
				if(optionBtn == optionButtonClicked)
				{
					continue;
				}            
				
				(optionBtn as GamePiece).selected = false;
			}
		}
		                                                 
		protected function wireSubmit(submitButton:Sprite):void
		{              
			if(_submitButton != null)
			{
				_submitButton.removeEventListener(MouseEvent.CLICK, processSubmit);
			}
			_submitButton = submitButton;
			_submitButton.addEventListener(MouseEvent.CLICK, processSubmit);
		}                                                                  
		
		protected function processSubmit(e:MouseEvent):void
		{
			for (var optionBtn:* in optionsByButton)
			{
				if((optionBtn as GamePiece).selected)
				{
					optionsByButton[optionBtn].execute();
				}
			}
		}   
				 
	}
}