package learninggames.model {

	import asunit.framework.TestCase;
	import learninggames.view.ToggleGamePiece;
	import com.newloop.util.UnitHelpers;
	import learninggames.view.ISelectable;
	import flash.display.Sprite;

	public class CombinationRuleSetTest extends TestCase {
		private var instance:CombinationRuleSet;
		
		private var gamePieces:Vector.<ISelectable>;
		private var optionButtons:Vector.<Sprite>;
		
		private var AT_LEAST:uint = 2;
		private var NOT_MORE_THAN:uint = 4;

		public function CombinationRuleSetTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();  
			createToggleGamePieces(10);
			instance = new CombinationRuleSet(AT_LEAST, NOT_MORE_THAN, gamePieces);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is CombinationRuleSet", instance is CombinationRuleSet);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_selecting_minimum_elements_passes():void
		{
		    assertFalse("combination is not valid", instance.valid);
		    UnitHelpers.clickItem(optionButtons[1]);
		    assertFalse("combination is not valid", instance.valid);
		    UnitHelpers.clickItem(optionButtons[2]);
		    assertTrue("combination is valid", instance.valid);
		}
		
		public function test_selecting_maximum_elements_passes():void
		{
		    UnitHelpers.clickItem(optionButtons[3]);
		    UnitHelpers.clickItem(optionButtons[4]);
		    UnitHelpers.clickItem(optionButtons[5]);
		    UnitHelpers.clickItem(optionButtons[6]);
		    assertTrue("combination is valid", instance.valid);
			UnitHelpers.clickItem(optionButtons[2]);
			assertFalse("combination is not valid", instance.valid);
		}
		
		public function test_selecting_mid_number_elements_passes():void
		{
		    UnitHelpers.clickItem(optionButtons[3]);
		    UnitHelpers.clickItem(optionButtons[4]);
		    UnitHelpers.clickItem(optionButtons[5]);
		    assertTrue("combination is valid", instance.valid);
		}   
		
		private function createToggleGamePieces(noOfPieces:uint):void
		{
			gamePieces = new Vector.<ISelectable>();
			optionButtons = new Vector.<Sprite>();
			
			var iLength:uint = noOfPieces;
			for (var i:int = 0; i < iLength; i++)
			{
				var nextButton:Sprite = new Sprite();
				var nextPiece:ToggleGamePiece = new ToggleGamePiece(nextButton);
				optionButtons.push(nextButton);
				gamePieces.push(nextPiece);
			}
		}
	}
}