package sample;

import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import org.zamedev.particles.ParticleSystem;
import org.zamedev.particles.loaders.ParticleLoader;
import org.zamedev.particles.renderers.DefaultParticleRenderer;

class App extends Sprite {
    private var mousePressed:Bool = false;
    private var particleSystemList:Array<ParticleSystem> = [];
    private var infoTextField:TextField;
    private var currentIndex:Int = 0;

    public function new() {
        super();

        addClickableArea();
        addInterface();
        loadAndAddParticles();
        updateInfo();

        addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
        addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
    }

    private function addClickableArea():Void {
        graphics.clear();
        graphics.beginFill(0x030b2d);
        graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
        graphics.endFill();
    }

    private function addInterface():Void {
        addTextField(20, 20, 100, 0xfab91e, 0x000000, "Prev");
        infoTextField = addTextField(120, 20, 100, -1, 0xffffff);
        addTextField(220, 20, 100, 0xfab91e, 0x000000, "Next");
        addTextField(20, 55, 300, -1, 0xffffff, "Click to emit");
    }

    private function addTextField(x:Float, y:Float, width:Float, backgroundColor:Int, textColor:Int, ?text:String):TextField {
        var textField = new TextField();
        textField.x = x;
        textField.y = y;
        textField.width = width;
        textField.height = #if flash 30 #else 25 #end;
        textField.embedFonts = true;

        if (backgroundColor >= 0) {
            textField.background = true;
            textField.backgroundColor = backgroundColor;
        }

        var textFormat = new TextFormat();
        textFormat.size = 24;
        textFormat.color = textColor;
        textFormat.font = Assets.getFont("font/Intro.ttf").fontName;
        textFormat.align = TextFormatAlign.CENTER;

        textField.defaultTextFormat = textFormat;

        if (text != null) {
            textField.text = text;
        }

        addChild(textField);
        return textField;
    }

    private function loadAndAddParticles():Void {
        var particlesRenderer = new DefaultParticleRenderer();
        addChild(cast particlesRenderer);

        particleSystemList.push(ParticleLoader.load("particle/heart.pex"));
        particleSystemList.push(ParticleLoader.load("particle/fountain.lap"));
        particleSystemList.push(ParticleLoader.load("particle/bubbles.json"));
        particleSystemList.push(ParticleLoader.load("particle/fire.plist"));
        particleSystemList.push(ParticleLoader.load("particle/frosty-blood.plist"));
        particleSystemList.push(ParticleLoader.load("particle/line-of-fire.plist"));
        particleSystemList.push(ParticleLoader.load("particle/trippy.plist"));
        particleSystemList.push(ParticleLoader.load("particle/sun.plist"));
        particleSystemList.push(ParticleLoader.load("particle/iris.plist"));
        particleSystemList.push(ParticleLoader.load("particle/hyperflash.plist"));
        particleSystemList.push(ParticleLoader.load("particle/airStars.plist"			));
		
        particleSystemList.push(ParticleLoader.load("particle/iceDamage.plist"           ));
        particleSystemList.push(ParticleLoader.load("particle/airDamage.plist"           ));
        particleSystemList.push(ParticleLoader.load("particle/newAltarFlames.plist"      ));
        particleSystemList.push(ParticleLoader.load("particle/earthDamage.plist"         ));
        particleSystemList.push(ParticleLoader.load("particle/explosion.plist"           ));
        particleSystemList.push(ParticleLoader.load("particle/explosionSmoke.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/fireDamage.plist"          ));
        particleSystemList.push(ParticleLoader.load("particle/newHeroCharge.plist"       ));
        particleSystemList.push(ParticleLoader.load("particle/itemPickup.plist"          ));
        particleSystemList.push(ParticleLoader.load("particle/lightDamage.plist"         ));
        particleSystemList.push(ParticleLoader.load("particle/skid.plist"	            )); 
        particleSystemList.push(ParticleLoader.load("particle/waterDamage.plist"         ));
        particleSystemList.push(ParticleLoader.load("particle/windPanelEffect.plist"     ));
        particleSystemList.push(ParticleLoader.load("particle/bulletFireEnemy.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/bulletFireHero.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/bulletFireHero3.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/bulletWaterHero.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/healingItem.plist"	        ));
        particleSystemList.push(ParticleLoader.load("particle/statusItem.plist"	        ));
        
		particleSystemList.push(ParticleLoader.load("particle/useRimon.plist"	        )); 
        particleSystemList.push(ParticleLoader.load("particle/useShofar.plist"	        ));
        particleSystemList.push(ParticleLoader.load("particle/vanityItem.plist"	        ));
        particleSystemList.push(ParticleLoader.load("particle/useItemCarousel.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/beamCannonPhysical.plist"  ));
        particleSystemList.push(ParticleLoader.load("particle/blueKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/cyanKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/goldKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/greenKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/limeKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/pinkKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/redKiteDeath.plist"	    )); 
        particleSystemList.push(ParticleLoader.load("particle/yellowKiteDeath.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/drainBeam.plist"	        ));
        particleSystemList.push(ParticleLoader.load("particle/tinyFlames.plist"	        ));
        particleSystemList.push(ParticleLoader.load("particle/fountain.plist"	        )); 
        particleSystemList.push(ParticleLoader.load("particle/altarDeath.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/resistAirDamage.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/resistEarthDamage.plist"   ));
        particleSystemList.push(ParticleLoader.load("particle/resistFireDamage.plist"	)); 
        
		particleSystemList.push(ParticleLoader.load("particle/resistWaterDamage.plist"   ));
        particleSystemList.push(ParticleLoader.load("particle/resistIceDamage.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/resistLightDamage.plist"   ));
        particleSystemList.push(ParticleLoader.load("particle/iris.plist"		        )); 
        particleSystemList.push(ParticleLoader.load("particle/enemyExplosion.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/miniFlames.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/statUp.plist"		        ));
        particleSystemList.push(ParticleLoader.load("particle/statDown.plist"		    )); 
        particleSystemList.push(ParticleLoader.load("particle/statusStun.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/statusConfuse.plist"	    ));
        particleSystemList.push(ParticleLoader.load("particle/statusSlow.plist"		    ));
        
		particleSystemList.push(ParticleLoader.load("particle/statusBlind.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/statusFear.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/statusDisarm.plist"		)); 
        particleSystemList.push(ParticleLoader.load("particle/statusHaste.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/statusRegen.plist"		    ));
        particleSystemList.push(ParticleLoader.load("particle/statusSick.plist"          ));
		
		particleSystemList.push(ParticleLoader.load("particle/pinkBlubber.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/pastelFirework.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/noxiousFart.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/newSun.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/nebia.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/laser.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/hypnotron.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/hyperbeam.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/hellFire.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/heart.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/flame.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/featherScatter.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/fastGalaxy.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/emmassharing.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/electrons.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/dazedStars.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/crazyBlue.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/cosmicCloud.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/BuildingCrumble.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/blackhole.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/3050.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/whiteRipple.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/warpField.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/tourni.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/test001.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/simpleSmoke.plist"		    ));
		particleSystemList.push(ParticleLoader.load("particle/pollenInTheSun.plist"		    ));
		
        for (particleSystem in particleSystemList) {
            particlesRenderer.addParticleSystem(particleSystem);
        }
    }

    private function updateInfo():Void {
        infoTextField.text = Std.string(currentIndex + 1) + ":" + Std.string(particleSystemList.length);
        particleSystemList[currentIndex].emit(stage.stageWidth / 2, stage.stageHeight / 2);
    }

    private function onMouseDown(e:Event):Void {
        var me:MouseEvent = cast e;

        if (me.stageX >= 20 && me.stageY <= #if flash 50 #else 45 #end) {
            if (me.stageX >= 20 && me.stageX <= 120) {
                particleSystemList[currentIndex].stop();
                currentIndex = (currentIndex - 1 + particleSystemList.length) % particleSystemList.length;
                updateInfo();
                return;
            }

            if (me.stageX >= 220 && me.stageX <= 320) {
                particleSystemList[currentIndex].stop();
                currentIndex = (currentIndex + 1) % particleSystemList.length;
                updateInfo();
                return;
            }
        }

        particleSystemList[currentIndex].emit(me.stageX, me.stageY);
        mousePressed = true;
    }

    private function onMouseMove(e:Event):Void {
        if (mousePressed) {
            var me:MouseEvent = cast e;
            particleSystemList[currentIndex].emit(me.stageX, me.stageY);
        }
    }

    private function onMouseUp(e:Event):Void {
        mousePressed = false;
    }
}
