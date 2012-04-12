package  
{
	import flash.net.SharedObject;
	/**
	 * Permet de récupérer un texte multilingue.
	 * @author Neamar
	 */
	public class Language
	{
		private static const EN:Object =
		{
			HAMILTON_TUTO:"<p>Well done.<br></p><p>New rule: you have to pass once and only once over each nail, only passing over existing gray lines (although you don't necessarily have to go over each line).<br></p><p>Last but not least: you must end with the nail you started from.</p>",
			EULER_TUTO:"<p><br><br>Tap a nail to start.<br />Then swipe your finger to redraw the gray shape without going twice over the same line.<br></p><p>Double tap to start over.</p>",
			END_EULER:"To win a race, the swiftness of a dart...",
			SPONSOR:"<a href=\"http://neamar.fr/Res/\">Neamar</a>"
		};
		
		
		public static function _(v:String):String
		{
			return EN[v];
		}
	}

}