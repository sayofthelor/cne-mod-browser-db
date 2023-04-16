function onPlayerHit(e) {
    if (!e.note.isSustainNote) {
        FlxG.sound.play(Paths.sound("hit"), 0.4);
        camGame.shake(0.01, 0.1, null, true);
        camHUD.camera.flash(0xffcccccc, 0.1);
    }
}

function update(elapsed) {
    Conductor.bpm = 150;
    iconP1.y = healthBar.y - (iconP1.height / 2);
    iconP2.y = healthBar.y - (iconP2.height / 2);
}