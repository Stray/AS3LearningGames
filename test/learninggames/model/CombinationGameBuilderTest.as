package learninggames.model {

	import asunit.framework.TestCase;
	import flash.display.Sprite;
	import com.newloop.util.UnitHelpers;

	public class CombinationGameBuilderTest extends TestCase { 
		
		private var instance:CombinationGameBuilder;
        
		private var combinationGame:CombinationGame;
		
		private var btn1:Sprite;
		private var btn2:Sprite;
		private var btn3:Sprite;
		private var btn4:Sprite;
		private var btn5:Sprite;
		private var btn6:Sprite;
		private var btn7:Sprite;
		private var btn8:Sprite; 
		private var btn9:Sprite; 
		private var btn10:Sprite;
		private var btn11:Sprite;
		private var btn12:Sprite; 
		private var btn13:Sprite; 
		
		private var submitButton:Sprite;
		
		private var _completedRan:Boolean;
		private var _failedRan:Boolean;
		

		public function CombinationGameBuilderTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new CombinationGameBuilder();
			createButtons();
			_completedRan = false;
			_failedRan = false;
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is CombinationGameBuilder", instance is CombinationGameBuilder);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		
		public function test_first_correct_combination_wins_simple_game():void {
			buildSimpleCombinationGame();
			UnitHelpers.clickItem(btn1);
	        UnitHelpers.clickItem(submitButton);
			assertFalse("failed handler has not run", _failedRan);
			assertTrue("completed handler has run", _completedRan);
		}

		public function test_second_correct_combination_wins_simple_game():void {
			buildSimpleCombinationGame();
			UnitHelpers.clickItem(btn2);
	        UnitHelpers.clickItem(submitButton);
			assertFalse("failed handler has not run", _failedRan);
			assertTrue("completed handler has run", _completedRan);
		}
		
		public function test_no_correct_combination_loses_simple_game():void {
			buildSimpleCombinationGame();
	        UnitHelpers.clickItem(submitButton);
			assertFalse("completed handler has not run", _completedRan);
			assertTrue("failed handler has run", _failedRan);
		}
		
		public function test_valid_combination_wins_complex_game():void
		{
			buildComplexCombinationGame();
			UnitHelpers.clickItem(btn2); 
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn3);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn4);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn9);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn10);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn12);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn13);  
			UnitHelpers.clickItem(submitButton);
	        assertTrue("completed handler has run", _completedRan);
			
		}
		
		public function test_valid_combination_wins_complex_game_2():void
		{
			buildComplexCombinationGame();
			UnitHelpers.clickItem(btn1); 
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn3);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn4);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn9);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn12);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn13);  
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn10);
			UnitHelpers.clickItem(submitButton);
	        assertTrue("completed handler has run", _completedRan);
			
		}       
		
		public function test_valid_combination_wins_complex_game_3():void
		{
			buildComplexCombinationGame();
			UnitHelpers.clickItem(btn1); 
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn3);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn5);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn9);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn12);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn11);  
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn10);
			UnitHelpers.clickItem(submitButton);
	        assertTrue("completed handler has run", _completedRan);
		}
		
		public function test_invalid_combination_loses_complex_game():void
		{
			buildComplexCombinationGame();
			UnitHelpers.clickItem(btn1); 
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn3);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn5);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn9);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn12);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn11);  
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
			UnitHelpers.clickItem(btn10);
			UnitHelpers.clickItem(submitButton);
	        assertTrue("completed handler has run", _completedRan);
			_completedRan = false;
			UnitHelpers.clickItem(btn8);
			UnitHelpers.clickItem(submitButton);
	        assertFalse("completed handler has not run", _completedRan);
		}


		private function buildComplexCombinationGame():void
		{
			combinationGame = new CombinationGameBuilder()
								.requireOnlyOneOf(new <Sprite>[btn1, btn2])
								.requireOneOrMoreOf(new <Sprite>[btn3, btn4])
								.requireAnyOrNoneOf(new <Sprite>[btn5, btn6])
								.requireNoneOf(new <Sprite>[btn7, btn8])
								.requireAllOf(new <Sprite>[btn9, btn10])
								.requireAtLeastNOf(2, new <Sprite>[btn11, btn12, btn13])
								.addSubmitButton(submitButton)
								.build();
			
			combinationGame.completedSignal.add(completedHandler);
			combinationGame.failedSignal.add(failedHandler);				
			
		}
		
		private function buildSimpleCombinationGame():void
		{
			combinationGame = new CombinationGameBuilder()
								.requireOnlyOneOf(new <Sprite>[btn1, btn2])
								.addSubmitButton(submitButton)
								.build();
			
			combinationGame.completedSignal.add(completedHandler);
			combinationGame.failedSignal.add(failedHandler);				
			
		}
		
		private function completedHandler():void
		{
			_completedRan = true;
		}
		
		private function failedHandler():void
		{
			_failedRan = true;
		}   
		
		
		private function createButtons():void
		{
			var iLength:uint = 13;
			for (var i:int = 1; i <= iLength; i++)
			{
				this['btn' + i.toString()] = new Sprite(); 
			}
			
			submitButton = new Sprite();
		}
	}
}