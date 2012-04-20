package Levels
{
	import com.greensock.TweenLite;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	/**
	 * Le niveau de présentation des crédits
	 * @author Neamar
	 */
	public class CreditsLevel extends TextLevel
	{
		private const DUREE:int = 3;
		
		[Embed(source = "../../assets/Icosien.png")]
		private var Logo:Class;
		[Embed(source = "../../assets/Neamar.png")]
		private var Neamar:Class;
		[Embed(source = "../../assets/Licoti.png")]
		private var Licoti:Class;
		
		private var Image:Bitmap = new Logo();
		private var ImageNeamar:Bitmap = new Neamar();
		private var ImageLicoti:Bitmap = new Licoti();

		private var currentPoint:pt;
		private var points:Vector.<pt> = Vector.<pt>([
			new pt(30, 130),
			new pt(640, 70),
			new pt(580, 300),
			new pt(630, 470),
			new pt(20, 460),
			new pt(10, 10),
			new pt(150, 10),
			new pt(30, 130)
		]);
		private var timeBeforeChange:int = 0;
		
		public function CreditsLevel(Datas:String)
		{
			super(Datas,"SPONSOR");

			Image.x = (Main.WIDTH - Image.width) / 2;
			ImageNeamar.x = (Main.WIDTH - ImageNeamar.width) / 2;
			ImageLicoti.x = (Main.WIDTH - ImageLicoti.width) / 2;
			
			Image.y = ImageNeamar.y = ImageLicoti.y = 180;
			
			ImageNeamar.alpha = 0;
			ImageLicoti.alpha = 0;
			addChild(Image);
			addChild(ImageNeamar);
			addChild(ImageLicoti);
			
			//Afficher le texte en bas à droite.
			Aide.x = Main.WIDTH - Aide.textWidth - 20;
			Aide.y = Main.HEIGHT - Aide.textHeight;
			
			AideEffet.addEventListener(MouseEvent.CLICK, gotoSponsor);
			AideEffet.mouseEnabled = true;
			AideEffet.buttonMode = true;
			AideEffet.useHandCursor = true;
			
			TweenLite.to(Image, DUREE, { alpha:1, onComplete:switchToNeamar } );
			
			Toile.mouseEnabled = false;
			Toile.Points[0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
			
			addEventListener(Event.ENTER_FRAME, moveDemo);
		}
		
		public override final function destroy(e:Event=null):void
		{
			if(contains(Image))
				removeChild(Image);
			removeChild(ImageNeamar);
			removeChild(ImageLicoti);

			Image.bitmapData.dispose();
			ImageNeamar.bitmapData.dispose();
			ImageLicoti.bitmapData.dispose();
			Image = ImageLicoti = ImageNeamar = null;
			
			removeEventListener(Event.ENTER_FRAME, moveDemo);
		}
		
		public function moveDemo(e:Event):void
		{
			timeBeforeChange--;
			
			if (timeBeforeChange < 0)
			{
				currentPoint = points.shift();
				timeBeforeChange = 30;
				
				if (points.length == 0)
				{
					removeEventListener(Event.ENTER_FRAME, moveDemo);
					return;
				}
			}
			
			var offset:Number = timeBeforeChange / 30;
			var currentMouse:flash.geom.Point = pt.interpolate(currentPoint, points[0], offset);
			Toile.dispatchEvent(new MouseEvent(MouseEvent.MOUSE_MOVE, true, false, currentMouse.x, currentMouse.y));
		}
		
		protected final override function checkVictory():void
		{ 	}
		
		/**
		 * Efface Icosien, passe sur Neamar.
		 */
		public function switchToNeamar():void
		{
			if (Image != null)
			{
				TweenLite.to(Image,DUREE,{alpha:0})
				TweenLite.to(ImageNeamar, DUREE, { alpha:1, onComplete:switchToLicoti } );
			}
		}
		
		/**
		 * Efface Neamar, passe sur Licoti.
		 */
		public function switchToLicoti():void
		{
			if (Image != null)
			{
				removeChild(Image);
				TweenLite.to(ImageNeamar, DUREE, { alpha:0 } );
				TweenLite.to(ImageLicoti, DUREE, { alpha:1, onComplete:makeVictory } );
			}
		}
		
		public function makeVictory():void
		{
			dispatchEvent(new Event(LEVEL_WIN));
		}
		
		public function gotoSponsor(e:Event):void
		{
			var request:URLRequest = new URLRequest("http://www.mini-jeu-gratuit.fr/vip/neamar/");
			try {
			  navigateToURL(request, '_blank'); //Dans une nouvelle fenêtre (probablement nouvel onglet en fait)
			} catch (e:Error) {
			  trace("Impossible de lancer la fenêtre :(");
			}
		}
	}
}

class pt extends flash.geom.Point
{
	public static function interpolate(p:pt, p2:pt, f:Number):flash.geom.Point
	{
		return flash.geom.Point.interpolate(p, p2, f);
	}
	public function pt(x:int, y:int)
	{
		super(x, y);
	}
}