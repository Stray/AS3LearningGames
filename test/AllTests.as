package {
	/**
	 * This file has been automatically created using
	 * #!/usr/bin/ruby script/generate suite
	 * If you modify it and run this script, your
	 * modifications will be lost!
	 */

	import asunit.framework.TestSuite;
	import learninggames.model.CombinationGameBuilderTest;
	import learninggames.model.CombinationRuleSetTest;
	import learninggames.model.GamePieceMemoTest;
	import learninggames.model.OptionGameBuilderTest;
	import learninggames.model.OptionGameTest;
	import learninggames.model.OptionWithConsequenceTest;
	import learninggames.view.GamePieceTest;

	public class AllTests extends TestSuite {

		public function AllTests() {
			addTest(new learninggames.model.CombinationGameBuilderTest());
			addTest(new learninggames.model.CombinationRuleSetTest());
			addTest(new learninggames.model.GamePieceMemoTest());
			addTest(new learninggames.model.OptionGameBuilderTest());
			addTest(new learninggames.model.OptionGameTest());
			addTest(new learninggames.model.OptionWithConsequenceTest());
			addTest(new learninggames.view.GamePieceTest());
		}
	}
}
