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
			EULER_TUTO:"<p>Reproduisez le motif gris d'un seul mouvement de souris, sans repasser deux fois sur le même trait (mais les croisements de fil sont autorisés).<br /> Double cliquez pour recommencer !</p><p></p>Ayez des mouvements amples de souris, imaginez que vous tirez un fil derrière vous : pas besoin de frôler les clous !</p><p></p><p>Pour commencer à jouer, entraînez-vous sur la flèche ci-dessous.<br />Cliquez sur un clou pour attacher votre corde et commencer.</p>",
			HAMILTON_TUTO:"<p>Vous avez maintenant fini l'échauffement, passons à la partie intéressante !</p><p></p><p>Changement de règle : il faut passer une et une seule fois sur chaque clou, en utilisant uniquement les traits disponibles pour joindre deux clous (mais vous n'êtes pas obligés de passer sur tous les traits).</p><p>Contrainte supplémentaire : il faut commencer et finir sur le même point.</p>",
			END_EULER:"想赢得比赛，就要像风一样快……",
			SPONSOR:"访问 <a href=\"http://neamar.fr/Res/\">体验更多游戏。</a>"
		};
		
		
		public static function _(v:String):String
		{
			return EN[v];
		}
	}

}