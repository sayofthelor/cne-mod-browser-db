import openfl.geom.Rectangle;
import openfl.text.TextFormat;
import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import("ScoreText");
import ScoreText;

var timeBarBG:FlxSprite;
var timeBar:FlxBar;
var timeTxt:FlxText;
var scoreTxtTween:FlxTween;

EngineSettings.smoothHealthbar = false;
EngineSettings.showPressDelay = false;

function createPost() {
    for(e in [timerNow, timerFinal, timerText, timerBG, timerBar]) {
         e.visible = false;
    }
  
  
    timeTxt = new FlxText(0, 19, 400, "X:XX", 32);
    timeTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, "center", scoreTxt.borderStyle, FlxColor.BLACK);
    timeTxt.scrollFactor.set();
    timeTxt.alpha = 0;
    timeTxt.borderColor = 0xFF000000;
    timeTxt.borderSize = 2;
    timeTxt.screenCenter(FlxAxes.X);
    if(EngineSettings.downscroll) timeTxt.y = FlxG.height - 44;
  
    timeBarBG = new FlxSprite();
    timeBarBG.x = timeTxt.x;
    timeBarBG.y = timeTxt.y + (timeTxt.height / 4);
    timeBarBG.scrollFactor.set();
    timeBarBG.color = FlxColor.BLACK;
    timeBarBG.loadGraphic(Paths.image("psychTimeBar"));
    add(timeBarBG);
  
    timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, null, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), Conductor, 'songPosition', 0, 1);
    timeBar.scrollFactor.set();
    timeBar.createFilledBar(0xFF000000, 0xFFFFFFFF);
    timeBar.numDivisions = 400; //Toned it down to 400 to see what it would look like.
    timeBar.alpha = 0;
    add(timeBarBG);
    add(timeBar);
    add(timeTxt);
  
    timeBarBG.x = timeBar.x - 4;
    timeBarBG.y = timeBar.y - 4;
  
  
    timeBar.cameras = [camHUD];
    timeBarBG.cameras = [camHUD];
    timeTxt.cameras = [camHUD];

    PlayState.scoreTxt.size = 20;
    PlayState.scoreTxt.y = PlayState.healthBarBG.y + 50;
  }

  function onSongStart() {
    FlxTween.tween(timeBar, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    FlxTween.tween(timeTxt, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
}

function updatePost(elapsed:Float) {
    if (inst != null && timeBar.max != inst.length) {
        timeBar.setRange(0, Math.max(1, inst.length));
    }
  
    if (inst != null) {
        var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
        var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
        var minutes = Std.int(timeRemaining / 60);
        timeTxt.text = minutes + ":" + seconds;
    }

    var acc = FlxMath.roundDecimal(PlayState.accuracy_ * 100, 2);
    if (Math.isNaN(acc)) acc = 0;
    PlayState.scoreTxt.text = 'Score: ' + PlayState.songScore + ' | Misses: ' + PlayState.misses +  ' | Rating: ' + ScoreText.getRating(acc) + ' (' + acc + '%)';
    PlayState.scoreTxt.y = PlayState.healthBarBG.y + 25;
  }

  function onPlayerHit(note:Note) {
    if(!note.isSustainNote){
        if(scoreTxtTween != null) {
            scoreTxtTween.cancel();
        }
        scoreTxt.scale.x = 1.075;
        scoreTxt.scale.y = 1.075;
        scoreTxtTween = FlxTween.tween(PlayState.scoreTxt.scale, {x: 1, y: 1}, 0.2, {
            onComplete: function(twn:FlxTween) {
                scoreTxtTween = null;
            }
        });
    
    }
}
