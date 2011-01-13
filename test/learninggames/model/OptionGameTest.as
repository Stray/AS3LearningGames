package learninggames.model {

	import asunit.framework.TestCase;
	import com.newloop.util.UnitHelpers;
	import learninggames.view.GamePiece;
	import flash.display.Sprite;

	public class OptionGameTest extends TestCase {
		private var optionGame:OptionGame;
		
		private var optionsVector:Vector.<OptionWithConsequence>;
		
		private var consequenceID:uint;
        
		private var submitButton:Sprite;

		public function OptionGameTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();                           
			createOptionsVector();  
			consequenceID = 0;
			submitButton = new Sprite();
			optionGame = new OptionGame(optionsVector, submitButton, false);
		}

		override protected function tearDown():void {
			super.tearDown();
			optionGame = null;
		}

		public function testInstantiated():void {
			assertTrue("optionGame is OptionGame", optionGame is OptionGame);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_selecting_a_single_option_shows_that_option_selected():void {
			UnitHelpers.clickItem(btn1);
			assertTrue("button 1 is selected", btn1.selected);
		}
		
		public function test_selecting_a_second_option_shows_that_option_selected_and_deselects_previous():void {
			UnitHelpers.clickItem(btn1);
			UnitHelpers.clickItem(btn2);
			UnitHelpers.clickItem(btn3);
			UnitHelpers.clickItem(btn1);
			assertTrue("button 1 is selected", btn1.selected);
			assertFalse("button 2 is not selected", btn2.selected);
			assertFalse("button 3 is not selected", btn3.selected);
		} 
		
		public function test_submitting_runs_the_correct_consequence():void {
			UnitHelpers.clickItem(btn1);
			UnitHelpers.clickItem(btn2);
            UnitHelpers.clickItem(submitButton);
			assertEquals("consequence function ran correctly", 2, consequenceID);
		}
		
		public function test_resubmit_works_until_endGame_runs():void {
			UnitHelpers.clickItem(btn1);
			UnitHelpers.clickItem(btn2);
            UnitHelpers.clickItem(submitButton);
			assertEquals("consequence function ran correctly", 2, consequenceID);
			UnitHelpers.clickItem(btn1);
            UnitHelpers.clickItem(submitButton);
			assertEquals("consequence function ran correctly", 1, consequenceID);
			optionGame.endGame();
			UnitHelpers.clickItem(btn2);
			assertFalse("button 2 is not selected", btn2.selected);
			assertEquals("consequence function not updated after endGame", 1, consequenceID);
   		}

 		private function get btn1():GamePiece
		{
			return optionsVector[0].optionButton;
		}
		
		private function get btn2():GamePiece
		{
			return optionsVector[1].optionButton;
		}
		
		private function get btn3():GamePiece
		{
			return optionsVector[2].optionButton;
		}
		
		private function createOptionsVector():void
		{
			optionsVector = new Vector.<OptionWithConsequence>();
			
			var gamePiece1:GamePiece = new GamePiece(new Sprite());
			var gamePiece2:GamePiece = new GamePiece(new Sprite());
			var gamePiece3:GamePiece = new GamePiece(new Sprite()); 
			
			gamePiece1.name = "GamePiece 1";
			gamePiece2.name = "GamePiece 2";
			gamePiece3.name = "GamePiece 3";
			
			var option1:OptionWithConsequence = new OptionWithConsequence(gamePiece1, consequence1);
			var option2:OptionWithConsequence = new OptionWithConsequence(gamePiece2, consequence2);
			var option3:OptionWithConsequence = new OptionWithConsequence(gamePiece3, consequence3);
			
			optionsVector.push(option1);
			optionsVector.push(option2);
			optionsVector.push(option3);
		}
		
		private function consequence1():void
		{
			consequenceID = 1;
		} 
		
		private function consequence2():void
		{
			consequenceID = 2;
		}
		
		private function consequence3():void
		{
			consequenceID = 3;
		}
		
	}
}