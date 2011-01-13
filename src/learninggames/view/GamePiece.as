package learninggames.view {
	
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	import learninggames.model.GamePieceMemo;
	import flash.events.MouseEvent;
	
	public class GamePiece extends Sprite implements ISelectable {
		
		protected var skinSprites:Dictionary;
		protected var _skin:Sprite;     
		
		protected const SKIN_IDENTIFIERS:Vector.<String> = Vector.<String>(['active', 'inactive', 'over', 'selected', 'deselected', 'correct']);
		
		public function GamePiece(skin:Sprite) { 
			init(skin);
		}
		
		public function toggleSelection():void
		{
			selected = !_selected;
		}
		
		public function reset():void
		{
			selected = false;
			active = true;
			correct = false;
		} 
		
		public function get skinName():String
		{
			return _skin.name;
		}
		
		public function get skin():Sprite
		{
		   return _skin;
		}
		
		public function replaceSkin(skin:Sprite):void
		{
			setupSkin(skin);
		}
		
		protected var _selected:Boolean;

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			if (value !== _selected)
			{
				_selected = value; 
				
				selectedSkin.visible = value;
				deselectedSkin.visible = !value;
			}
		}
		
		protected var _correct:Boolean;

		public function get correct():Boolean
		{
			return _correct;
		}

		public function set correct(value:Boolean):void
		{
			if (value !== _correct)
			{
				_correct = value;
				correctSkin.visible = value;
			}
		}
		
		protected var _active:Boolean;

		public function get active():Boolean
		{
			return _active;
		}

		public function set active(value:Boolean):void
		{
			if (value !== _active)
			{
				_active = value;              
				
				activeSkin.visible = _active;
				inactiveSkin.visible = !_active;
				
				buttonMode = _active;
				mouseEnabled = _active;
				
				setSkinIsActive(_active);
			}
		}
		
		public function createMemo():GamePieceMemo
		{
			return new GamePieceMemo(_active, _selected, _correct);
		}
		
		public function restoreFromMemo(memo:GamePieceMemo):void
		{
			active = memo.active;
			selected = memo.selected;
			correct = memo.correct;
		}
		 
		
		protected function init(skin:Sprite):void
		{
			_active = true;
			_correct = false;
			_selected = false;
			
			setupSkin(skin);
   		}                         
		
	    protected function showOverState(e:MouseEvent):void
		{
			overSkin.visible = true;
		}                           
		
		protected function showOutState(e:MouseEvent):void
		{
			overSkin.visible = false;
		}
		
		protected function pickUpClick(e:MouseEvent):void
		{
			dispatchEvent(e);
		}
		
		protected function setupSkin(skinSprite:Sprite):void
		{
		    trace("GamePiece::setupSkin(): " + skinSprite + " :: " + skinSprite.name);
			_skin = skinSprite;
		
		 	skinSprites = new Dictionary();
			
			addSkinListeners();                                                                                                                           
			findSkinParts();
			initSkinStates();
		}
		
		protected function setSkinIsActive(isActive:Boolean):void
		{
			if(_skin == null)
			{
				return;
			}          
			if(isActive)
			{
				addSkinListeners();
			}
			else
			{
				removeSkinListeners();
			}
		}
		
		protected function findSkinParts():void
		{
			var iLength:uint = _skin.numChildren;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextChild:Sprite = _skin.getChildAt(i) as Sprite;
				if(nextChild == null)
				{
					continue;
				}
				var nextChildName:String = nextChild.name;
				var nextChildNameSuffix:String = nextChildName.split("_").pop().toLowerCase();
				
				if(SKIN_IDENTIFIERS.indexOf(nextChildNameSuffix) > -1)
				{
					if(skinSprites[nextChildNameSuffix] != null)
					{
						throw new Error("When trying to initialise the game skin " + _skin + " I have found that there is more than one sprite on stage with the suffix " + nextChildNameSuffix);
						return;
					}
					skinSprites[nextChildNameSuffix] = nextChild;
				}
			}
		} 
		
		protected function addSkinListeners():void
		{
			if(_skin.hasEventListener(MouseEvent.CLICK))
			{
				return;
			}
			
			_skin.addEventListener(MouseEvent.CLICK, pickUpClick);
			_skin.addEventListener(MouseEvent.MOUSE_OVER, showOverState);
			_skin.addEventListener(MouseEvent.MOUSE_OUT, showOutState);
			
			_skin.buttonMode = true;
		}
		
		protected function removeSkinListeners():void
		{
			if(!_skin.hasEventListener(MouseEvent.CLICK))
			{
				return;
			}
			_skin.removeEventListener(MouseEvent.CLICK, pickUpClick);
			_skin.removeEventListener(MouseEvent.MOUSE_OVER, showOverState);
			_skin.removeEventListener(MouseEvent.MOUSE_OUT, showOutState);
			
			_skin.buttonMode = false;
		}
		
		protected function initSkinStates():void
		{
			activeSkin.visible = _active;
			inactiveSkin.visible = !_active;
			overSkin.visible = false;
			selectedSkin.visible = _selected;
			deselectedSkin.visible = !_selected;
			correctSkin.visible = _correct;
		}  
		
		protected function get activeSkin():Sprite
		{
			return skinSprites['active'] ||= new Sprite();
		} 
		
		protected function get inactiveSkin():Sprite
		{
			return skinSprites['inactive'] ||= new Sprite();
		}
		
		protected function get overSkin():Sprite
		{
			return skinSprites['over'] ||= new Sprite();
		}
		  
		protected function get selectedSkin():Sprite
		{
			return skinSprites['selected'] ||= new Sprite();
		}
		
		protected function get deselectedSkin():Sprite
		{
			return skinSprites['deselected'] ||= new Sprite();
		}
		
		protected function get correctSkin():Sprite
		{
			return skinSprites['correct'] ||= new Sprite();
		}
		
	   
	}
}