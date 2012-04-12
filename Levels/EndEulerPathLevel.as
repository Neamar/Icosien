package Levels 
{
	import Levels.Level;
	
	/**
	 * Le dernier niveau d'Euler.
	 * Tricky car il cache une arête non symétrique.
	 * @author Neamar
	 */
	public class EndEulerPathLevel extends EulerPathLevel
	{
		
		public function EndEulerPathLevel(Datas:String) 
		{
			super(Datas,'END_EULER');
			
			Aide.x = (Main.WIDTH - Aide.textWidth)/2;
			Aide.y = Main.HEIGHT - Aide.textHeight;
		}
	}

}