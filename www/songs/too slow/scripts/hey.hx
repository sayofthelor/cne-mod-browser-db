var newdad:Character
function postCreate() {
    newdad = new Character(770, 100, “welcomeWebp”, true);
    newdad.alpha = 0.0001; //To make it so it renders dad, but they’re invis. No lag spike.

    newdad2 = new Character(770, 100, “welcomeWebpGetcha”, true);
    newdad2.alpha = 0.0001; //To make it so it renders the second dad to switch, but they’re also invis. Still no lag spike.

}

function onPlayerHit(event)
    event.character = (boyfriend.visible) ? boyfriend: newBF;


function stepHit() {
    if (curStep == 398)
    {
        add(newdad);
        newdad.alpha = 1;
        dad.visible = true;
    }



    if (curStep = 400)
        dad.playAnim("singDOWN-alt");
    if (curStep = 402)
        dad.playAnim("singDOWN-alt");
    if (curStep = 404) //funny number
        dad.playAnim("singDOWN-alt");
    if (curStep = 406)
        dad.playAnim("singDOWN-alt");
    if (curStep = 408)
        dad.playAnim("singDOWN-alt");
    if (curStep = 410)
        dad.playAnim("singDOWN-alt");
    if (curStep = 412)
        dad.playAnim("singDOWN-alt");
//whee
    if (curBeat = 416)
        newdad.playAnim("end");

    if (curStep = 926)
    {
        newdad.playAnim("end");
        add(newdad2);
        newdad2.alpha = 1;
        newdad.alpha = 0.0001;
    }

    if (curStep == 1015) 
    {
       newdad.playAnim("singDOWN-alt");
       newdad2.alpha = 0;
       newdad.alpha = 0.0001;
//should switch back flawlessly if done right
    }


    if (curStep = 1022)
        dad.playAnim("singDOWN-alt");
    if (curStep = 1030)
        dad.playAnim("singDOWN-alt");
    if (curStep = 1038)
        dad.playAnim("singDOWN-alt");
    if (curStep = 1046)
        dad.playAnim("singDOWN-alt");
    if (curStep = 261)
        dad.playAnim("singDOWN-alt");

}




//var newBF:Character
//function postCreate() {
//    newBF = new Character(770, 100, “bf-pixel”, true);
//    newBF.alpha = 0.0001; //To make it so it renders bf, but they’re invis. No lag spike.
//}

//function onPlayerHit(event)
//    event.character = (boyfriend.visible) ? boyfriend: newBF;

//function stepHit() {
//    if (curStep == 64) {
//        add(newBF);
//        newBF.alpha = 1;
//        boyfriend.visible = false;
//    }
//}
//