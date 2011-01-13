package learninggames.view {

	import asunit.framework.TestCase;
	import flash.display.Sprite;
	import learninggames.model.GamePieceMemo;

	public class GamePieceTest extends TestCase {
		private var instance:GamePiece;
		private var skinSprites:Array;

		public function GamePieceTest(methodName:String=null) {
			super(methodName)
		}

		override protected function setUp():void {
			super.setUp();
			var skin:Sprite = createSkin();
			instance = new GamePiece(skin);
		}

		override protected function tearDown():void {
			super.tearDown();
			instance = null;
		}

		public function testInstantiated():void {
			assertTrue("instance is GamePiece", instance is GamePiece);
		}

		public function testFailure():void {
			assertTrue("Failing test", true);
		}
		
		public function test_get_selected():void {
			assertEquals("Get selected initially false", false, instance.selected);
		}
		
		public function test_get_correct():void {
			assertEquals("Get correct initially false", false, instance.correct);
		}
		
		public function test_get_active():void {
			assertEquals("Get active initially true", true, instance.active);
		} 
		
		public function test_set_selected():void {
			instance.selected =  true;
			assertEquals("Set selected", true , instance.selected);
			instance.selected =  false;
			assertEquals("Set selected", false , instance.selected);
		}
		
		public function test_set_correct():void {
			instance.correct =  true;
			assertEquals("Set correct", true , instance.correct);
			instance.correct =  false;
			assertEquals("Set correct", false , instance.correct);
		}
		
		public function test_set_active():void {
			instance.active =  true;
			assertEquals("Set active", true , instance.active);
			instance.active =   false;
			assertEquals("Set active", false , instance.active);
		}
		
		public function test_set_active_changes_skin_visibility():void {
			instance.active = true;
			assertTrue("shows active", skinSprites['active'].visible);
			assertFalse("hides inactive", skinSprites['inactive'].visible); 
			instance	.active = false;
			assertFalse("hides active", skinSprites['active'].visible);
			assertTrue("shows inactive", skinSprites['inactive'].visible); 
		}

	    public function test_set_selected_changes_skin_visibility():void {
			instance.selected = true;
			assertTrue("shows selected", skinSprites['selected'].visible);
			assertFalse("hides deselected", skinSprites['deselected'].visible); 
			instance.selected = false;
			assertFalse("hides selected", skinSprites['selected'].visible);
			assertTrue("shows deselected", skinSprites['deselected'].visible); 
		}
		
		public function test_set_correct_changes_skin_visibility():void {
			instance.correct = true;
			assertTrue("shows correct", skinSprites['correct'].visible);
			instance.correct = false;
			assertFalse("hides correct", skinSprites['correct'].visible);
		}
		
		public function test_createMemo():void {                         
			
			instance.active = true;
			instance.selected = true;
			instance.correct = true;
			
			var memo:GamePieceMemo = instance.createMemo();
			
			assertTrue("CreateMemo collects correct values", memo.active);
			assertTrue("CreateMemo collects correct values", memo.selected);
			assertTrue("CreateMemo collects correct values", memo.correct);

			instance.active = false;
			instance.selected = false;
			instance.correct = false;
			
			var memo2:GamePieceMemo = instance.createMemo();
			
			assertFalse("CreateMemo collects correct values", memo2.active);
			assertFalse("CreateMemo collects correct values", memo2.selected);
			assertFalse("CreateMemo collects correct values", memo2.correct);
		}
		
		public function test_restoreFromMemo():void {
			var memo:GamePieceMemo = new GamePieceMemo(false, false, true);
			
			instance.restoreFromMemo(memo); 
			
			assertFalse("restoreFromMemo sets active", instance.active);
			assertFalse("restoreFromMemo sets selected", instance.selected);
			assertTrue("restoreFromMemo sets correct", instance.correct);
		}
		
		
		private function createSkin():Sprite
		{
			var skin:Sprite = new Sprite();
			skinSprites = [];
			
			var mcActive:Sprite = new Sprite();
			mcActive.name = "something_mc_Active"; 
			
			var mcOver:Sprite = new Sprite();
			mcOver.name = "something_mc_Over";  
			
			var mcInactive:Sprite = new Sprite();
			mcInactive.name = "something_mc_Inactive";
			
			var mcSelected:Sprite = new Sprite();
			mcSelected.name = "something_mc_Selected";
			
			var mcDeselected:Sprite = new Sprite();
			mcDeselected.name = "something_mc_Deselected"; 
			
			var mcCorrect:Sprite = new Sprite();
			mcCorrect.name = "something_mc_Correct";

			skin.addChild(mcActive);
			skin.addChild(mcOver);
			skin.addChild(mcInactive);
			skin.addChild(mcSelected);
			skin.addChild(mcDeselected);
			skin.addChild(mcCorrect);  
			
			skinSprites['active'] = mcActive;
			skinSprites['inactive'] = mcInactive;
			skinSprites['over'] = mcOver;
			skinSprites['selected'] = mcSelected;
			skinSprites['deselected'] = mcDeselected;
			skinSprites['correct'] = mcCorrect;
			
			return skin;
			
		} 
		
		
	}
}