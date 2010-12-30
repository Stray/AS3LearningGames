package {
	import flash.display.Sprite;
	import flash.display.DisplayObject;
	import skins.AS3LearningGamesSkin;
	
	public class AS3LearningGames extends Sprite {

		public function AS3LearningGames() {
			addChild(new AS3LearningGamesSkin.ProjectSprouts() as DisplayObject);
			trace("AS3LearningGames instantiated!");
		}
	}
}
