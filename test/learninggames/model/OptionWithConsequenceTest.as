package learninggames.model {

	import asunit.framework.TestCase;
	import flash.display.Sprite;
	import learninggames.view.GamePiece;

	public class OptionWithConsequenceTest extends TestCase {
		private var instance:OptionWithConsequence;
		
		private const BUTTON:GamePiece = new GamePiece(new Sprite());
		private var _executed:Boolean;
		
		public function OptionWithConsequenceTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp(); 
			_executed = false;
			instance = new OptionWithConsequence(BUTTON, consequenceFunction);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is OptionWithConsequence", instance is OptionWithConsequence);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		private function consequenceFunction():void
		{
			_executed = true;
		}
		
		public function test_get_optionButton():void {
			assertEquals("Get optionButton", BUTTON, instance.optionButton);
		}
		
		public function test_execute():void {
			instance.execute();
			assertTrue("Executed the function ", _executed);
		}
		
	}
}