package Levels
{
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	/**
	 * Le niveau de présentation des crédits
	 * @author Neamar
	 */
	public class EndLevel extends TextLevel
	{
		[Embed(source = "../../assets/Fin.jpg")]
		private static var Fin:Class;
		
		private var Image:Bitmap = new Fin();
		
		public function EndLevel(Datas:String,Aide:String="")
		{	
			//Écraser les Datas et les remplacer par le positionnement des clous.
			Datas = "1000,1000|1001,1001|218,45|294,33|361,13|439,25|48,243|176,276|341,276|560,237:0,1";
			super(Datas,Aide);
	
			addChild(Image);
			setChildIndex(Image, 0);
			
			this.Aide.y = 350;
			
			addEventListener(MouseEvent.CLICK, downloadFull);
		}
		
		/**
		 * Rarement appelé, sauf si on fait touche gauche pour revenir au niveau précédent.
		 * @param	e
		 */
		public override final function destroy(e:Event=null):void
		{
			if(contains(Image))
				removeChild(Image);
			Image = null;
		}
		
		/**
		 * Initialise (réinitialise) un objet Eulris pour le niveau.
		 */
		protected override function initEulris(e:Event=null):void
		{
			super.initEulris(e);

			addChild(Image);
			setChildIndex(Image, 0);
		}
		
		/**
		 * Si le mec s'amuse à jouer, s'assurer qu'il ne peut pas gagner :)
		 */
		protected override final function checkVictory():void
		{
		}
		
		protected function downloadFull(e:Event):void
		{
			
			var request:URLRequest = new URLRequest("https://play.google.com/store/apps/details?id=air.neamar.Icosien");
			try {
			  navigateToURL(request, '_blank'); //Dans une nouvelle fenêtre (probablement nouvel onglet en fait)
			} catch (e:Error) {
			  trace("Impossible de lancer la fenêtre :(");
			}
		}
	}
	
}