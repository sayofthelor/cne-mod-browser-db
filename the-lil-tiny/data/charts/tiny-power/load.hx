var et:Float = 0;
function update(elapsed:Float) {
    et += elapsed;
    dad.scale.x = boyfriend.scale.y = Math.sin(et) * 0.5 + 1;
    dad.scale.y = boyfriend.scale.x = Math.cos(et) * 0.5 + 1;
    dad.angle += elapsed;
    boyfriend.angle -= elapsed;
    camGame.angle += elapsed;
}