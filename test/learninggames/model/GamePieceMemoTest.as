package learninggames.model {

	import asunit.framework.TestCase;

	public class GamePieceMemoTest extends TestCase {
		private var instance:GamePieceMemo; 
		
		public function GamePieceMemoTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			instance = new GamePieceMemo(true, false, true);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GamePieceMemo", instance is GamePieceMemo);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_active():void {  
			var memo:GamePieceMemo = new GamePieceMemo(true, false, false);
			assertEquals("Get active", true, memo.active);
			var memo2:GamePieceMemo = new GamePieceMemo(false, true, true);
			assertEquals("Get active", false, memo2.active);
		}
		
		public function test_get_selected():void {  
			var memo:GamePieceMemo = new GamePieceMemo(false, true, false);
			assertEquals("Get selected", true, memo.selected);
			var memo2:GamePieceMemo = new GamePieceMemo(true, false, true);
			assertEquals("Get selected", false, memo2.selected);
		}
		    
		public function test_get_correct():void {  
			var memo:GamePieceMemo = new GamePieceMemo(false, false, true);
			assertEquals("Get correct", true, memo.correct);
			var memo2:GamePieceMemo = new GamePieceMemo(true, true, false);
			assertEquals("Get correct", false, memo2.correct);
		} 
	}
}