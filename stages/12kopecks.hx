import psychlua.LuaUtils;

import hxcodec.flixel.FlxVideo;

import lime.system.System;

var video:FlxVideo;

function onCreate()
{
    final videoNames:Array<String> = ['asmrsoap', 'asmrcarpets', 'asmrpress', 'asmrslime', 'asmrspiderman'];

    var videoSprite:FlxSprite = new FlxSprite(250).makeGraphic(1, 1, FlxColor.TRANSPARENT);
    videoSprite.camera = LuaUtils.cameraFromString('camera');
    videoSprite.scale.set(6.2, 6.2);
    addToBG(videoSprite);

    video = new FlxVideo();
    video.alpha = 0;
    video.onTextureSetup.add(function()
    {
        videoSprite.loadGraphic(video.bitmapData);
    });

    final videoName:String = videoNames[FlxG.random.int(0, videoNames.length - 1)];
    video.play(Paths.video(videoName), true);
}

function addToBG(sprite:FlxSprite)
{
    game.insert(game.members.indexOf(LuaUtils.getLowestCharacterGroup()), sprite);
}
    
function onPause()
{
    if (video != null)
    {
        video.pause();

        if (FlxG.autoPause)
        {
            if (FlxG.signals.focusGained.has(video.resume))
                FlxG.signals.focusGained.remove(video.resume);

            if (FlxG.signals.focusLost.has(video.pause))
                FlxG.signals.focusLost.remove(video.pause);
        }
    }
}
    
function onResume()
{
    if (video != null)
    {
        video.resume();

        if (FlxG.autoPause)
        {
            if (!FlxG.signals.focusGained.has(video.resume))
                FlxG.signals.focusGained.add(video.resume);

            if (!FlxG.signals.focusLost.has(video.pause))
                FlxG.signals.focusLost.add(video.pause);
        }
    }
}
    
function onDestroy()
{
    if (video != null) 
    {
        video.stop();
        video.destroy();
    }
}

function onGameOver()
{
    System.exit(0);
}