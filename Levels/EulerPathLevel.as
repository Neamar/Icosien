﻿package Levels
{
	import com.greensock.TweenLite;
	import flash.events.Event;
	
	/**
	 * Un niveau que l'on gagne en créant un circuit eulérien sur le graphe, i.e en parcourant toutes les arêtes en une seule fois.
	 * @author Neamar
	 */
	public class EulerPathLevel extends TextLevel 
	{
		/**
		 * Constructeur.
		 * @param	Datas cf. super()
		 * @param	Aide Le texte d'aide à afficher au format HTML.
		 */
		public function EulerPathLevel(Datas:String,Aide:String="")
		{
			super(Datas,Aide);
		}
		
		/**
		 * Compare les dictionnaires Aretes et AretesInitiales. Si chacune de leurs clés sont égales, dispatch l'evenement LEVEL_WIN.
		 */
		protected override final function checkVictory():void
		{
			var P:Point;
			
			//Fast test : juste comparer les tailles des tableaux.
			//Complexité : O(n)
			for each(P in Points)
			{
				//Si les tailles diffèrent on peut s'arrêter tout de suite.
				if (Aretes[P].length != AretesInitiales[P].length)
					return;
			}
			
			//Si tous les tableaux sont égaux, il faut être plus exhaustif et vérifier que le contenu de chaque tableau est similaire aux autres.
			//Ici l'ordre n'a aucune importance : les tableaux sont donc des ensembles.
			//Mathématiquement pour prouver que A = B il faut prouver que A est inclus dans B ET QUE B est inclus dans A.
			//Ici cependant on va utiliser deux propriétés spécifiques de nos ensembles :
			// - ils font la même taille
			// - le contenu du tableau AretesInitiales[x] est unique (pas de doublons si le niveau est bien conçu).
			//Il suffit alors de prouver que tous les élements de AretesInitiales[x] sont dans Aretes[x], et ce pour tout x.
			//Complexité théorique O(n^3) (tous les points, tous les liens entre ces points, + une recherche avec indexOf)
			for each(P in Points)
			{
				for each(var P2:Point in AretesInitiales[P])
				{
					if(Aretes[P].indexOf(P2)==-1)
						return;
				}
			}

			dispatchEvent(new Event(LEVEL_WIN));
		}
		
		/**
		 * Redessine le premier noeud selectionné pour l'identifier facilement
		 * @param	e
		 */
		protected override function firstHookAdded(e:CustomEvent):void
		{
			var p:Point = (e.newHook.P as Point);
			p.scaleX = p.scaleY = 2.5;
			
			TweenLite.to(p, 1.5, { scaleX:1, scaleY:1 } );
			
			super.firstHookAdded(e);
		}
	}
}