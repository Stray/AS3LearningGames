package learninggames.model {
	
	public class GamePieceMemo {
		
		public function GamePieceMemo(active:Boolean, selected:Boolean, correct:Boolean){
			//trace("instantiating GamePieceMemo: ", Active, Selected, Correct);
			_active = active;
			_selected = selected;
			_correct = correct;
    		
			super();
			
		}
		
		//--------------------------------------
		//  PRIVATE VARIABLES
		//--------------------------------------
		
		private var _active:Boolean;
		private var _selected:Boolean;
		private var _correct:Boolean;
		
		
		//--------------------------------------
		//  GETTER/SETTERS
		//--------------------------------------
		
		public function get active():Boolean{
			return _active;
		}
		
		
		public function get selected():Boolean{
			return _selected;
		}
		
		
		public function get correct():Boolean{
			return _correct;
		} 
	}
}
