//If you are using this code, please make sure to credit me :)
//Made By: BlorpGneezer#8932
//Set up to legit aa, and normal aa
function aa_type (A,B,C){
    if(Tar == 1){UI.SetValue(["Rage", "Anti Aim", "Directions", "At targets"],A) }
    UI.SetValue(["Config","Cheat","General","Restrictions"],0);
    UI.SetValue(["Rage","Anti Aim","General","Pitch mode"],B);
    UI.SetValue(["Rage","Anti Aim","Directions","Yaw offset"],C);
}
//variables
const time = Globals.Realtime();
var E = true;
var Defuse = false;
var x = 1;
var key = 0;
const Yaw = UI.GetValue(["Rage", "Anti Aim", "Directions", "Yaw offset"]);
const Tar = UI.GetValue(["Rage", "Anti Aim", "Directions", "At targets"]);

function on_E(){
    var buttons = UserCMD.GetButtons();
  
    if(buttons == 4194336){
        if (Input.IsKeyPressed(x) == true){
            key = x;
            //Cheat.Print(key+"\n");
        }
        if(x >=100){
            x = 0;
        }
        x = x +1;
    }
    if (Input.IsKeyPressed(key) == true ){
        aa_type(0,0,180);
        E = false;
        if(Globals.Realtime() >= time + 0.2){
            if(E == false){
                Cheat.ExecuteCommand("+use");
                E = true;
            }
            if(E == true){
                Cheat.ExecuteCommand("-use");
            }
        }
    }else{
        if(E == true){
            Cheat.ExecuteCommand("-use");
            E = false;
          
        }
        aa_type(1,1,Yaw);
        time = Globals.Realtime();
    }
}
function Bomb (){
    var buttons = UserCMD.GetButtons();
    var C4 = Entity.GetEntitiesByClassID(128)[0];
    var Host = Entity.GetEntitiesByClassID(97)[0];
  
    if (C4 != undefined){
        var C4Loc = Entity.GetRenderOrigin(C4);
        var local = Entity.GetLocalPlayer();
        var lLoc = Entity.GetRenderOrigin(local)
        var distance = calcDist(C4Loc, lLoc);
        //Cheat.Print(distance +"\n");
        if(distance >= 100){
            on_E()
        }
    }else if(Host != undefined){
        var HLoc = Entity.GetRenderOrigin(Host);
        var local = Entity.GetLocalPlayer();
        var lLoc = Entity.GetRenderOrigin(local)
        var distance1 = calcDist(HLoc, lLoc);
        //Cheat.Print(distance +"\n");
        if(distance1 >= 100){
            on_E()
        }
    }else{
        on_E()
    }
}
//Thanks to : @Mased   https://www.onetap.com/threads/c4timer-dmg.33139/
function calcDist(local, target) {
    var lx = local[0];
    var ly = local[1];
    var lz = local[2];
    var tx = target[0];
    var ty = target[1];
    var tz = target[2];
    var dx = lx - tx;
    var dy = ly - ty;
    var dz = lz - tz;

    return Math.sqrt(dx * dx + dy * dy + dz * dz);
}

//Made By: BlorpGneezer#8932
//Onetap: https://www.onetap.com/members/mredoz.60729/

Cheat.RegisterCallback("CreateMove","Bomb");