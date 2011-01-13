package learninggames.model {

	import asunit.framework.TestCase;
	import com.newloop.util.UnitHelpers;
	import learninggames.view.GamePiece;
	import flash.display.Sprite;

	public class OptionGameBuilderTest extends TestCase {
		private var optionGame:OptionGame;
						
		private var consequencesActioned:Array; 
		
		private var consequenceHandler:Function;
		
		private var btn1:Sprite;
		private var btn2:Sprite;
		private var btn3:Sprite;
        
		private var submitButton:Sprite;

		public function OptionGameBuilderTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();                           
			consequencesActioned = [];
			submitButton = new Sprite();
			btn1 = new Sprite();
			btn2 = new Sprite();
			btn3 = new Sprite();
		}

		override protected function tearDown():void {
			super.tearDown();
			optionGame = null;
		}

		public function testInstantiatedTheGame():void {
			buildSingleOptionGame();
			assertTrue("optionGame is OptionGame", optionGame is OptionGame);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_resubmit_works_until_endGame_runs():void {
			buildSingleOptionGame();
			UnitHelpers.clickItem(btn1);
			UnitHelpers.clickItem(btn2);
            UnitHelpers.clickItem(submitButton);
			assertEqualsArrays("consequence function ran correctly", [2], consequencesActioned);
			UnitHelpers.clickItem(btn1);
            UnitHelpers.clickItem(submitButton);
			assertEqualsArrays("consequence function ran correctly", [1], consequencesActioned);
			optionGame.endGame();
			UnitHelpers.clickItem(btn2);
			assertEqualsArrays("consequence function not updated after endGame", [1], consequencesActioned);
   		}

		public function test_multi_select_game():void
		{
			buildMultiOptionGame();
			UnitHelpers.clickItem(btn1);
			UnitHelpers.clickItem(btn2);
            UnitHelpers.clickItem(submitButton);
			assertEqualsArrays("consequence function ran correctly", [1,2], consequencesActioned);
		}
 		
		
		private function consequence1():void
		{
			consequenceHandler(1);
		} 
		
		private function consequence2():void
		{
			consequenceHandler(2);
		}
		
		private function consequence3():void
		{
			consequenceHandler(3);
		}
		
		private function multiConsequenceHandler(option:uint):void
		{
			consequencesActioned.push(option);
		}
		
		private function singleConsequenceHandler(option:uint):void
		{
			consequencesActioned = [option];
		}  
		
		
		private function buildSingleOptionGame():void
		{
			optionGame = new OptionGameBuilder()
							.addOptionWithConsequence(btn1, consequence1)
							.addOptionWithConsequence(btn2, consequence2)
							.addOptionWithConsequence(btn3, consequence3)
							.addSubmitButton(submitButton)
							.build();
							
			consequenceHandler = singleConsequenceHandler;
		}
		
		private function buildMultiOptionGame():void
		{
			var multiOptionGame:OptionGame = new OptionGameBuilder()
							.addOptionWithConsequence(btn1, consequence1)
							.addOptionWithConsequence(btn2, consequence2)
							.addOptionWithConsequence(btn3, consequence3)
							.addSubmitButton(submitButton)
							.allowMultipleSelection()
							.build(); 
			
			consequenceHandler = multiConsequenceHandler;
		}
		
	}
}