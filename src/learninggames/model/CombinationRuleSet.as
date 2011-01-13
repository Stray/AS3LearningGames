package learninggames.model {
	
	import learninggames.view.ISelectable;
	
	public class CombinationRuleSet {
		
		protected var _options:Vector.<ISelectable>;
		protected var _atLeast:uint;
		protected var _notMoreThan:uint;
		
		public function CombinationRuleSet(atLeast:uint, notMoreThan:uint, options:Vector.<ISelectable>) {
			_options = options;
			_atLeast = atLeast;
			_notMoreThan = notMoreThan;
		}
		
		public function get valid():Boolean
		{
			return validate();
		}                     
		
		protected function validate():Boolean
		{
			var selectedCount:uint = countSelectedItems();
			if((selectedCount < _atLeast) || (selectedCount > _notMoreThan))
			{
				return false;
			}           
			     
			return true;
		}
		
		protected function countSelectedItems():uint
		{
			var selectedCount:uint = 0;
			var iLength:uint = _options.length;
			for (var i:int = 0; i < iLength; i++)
			{
				if(_options[i].selected)
				{
					selectedCount++;
				}
			}                       
			
			return selectedCount;
		}
	}
}