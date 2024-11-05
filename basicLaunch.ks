


// declare function ListScienceModules {

//     declare local scienceModules to list().
//     declare local partList to ship:parts.

//     for thePart in partList{
//         declare local moduleList to thePart:modules.
//         from {local i is 0.} until i = moduleList:length step {set i to i+1.} do{
//         set theModule to moduleList[i].
//         if (theModule = "ModuleScienceExperiment") or (theModule = "DMModuleScienceAnimate"){
//             scienceModules:add(thePart:getmodulebyindex(i)). 
//         }
//         }
//     }
// return scienceModules.
// } 

set stages to 2.
function main {
    countDown().
    ascent().
    set stagesUsed to 0.
    until stagesUsed = stages or apoapsis>100000{
        autoStage().
    }
    circulize().
    turnOffGuidence().
    // deployParachutes().
}



function countDown{
    print"counting down".
    from {local countdownTimer is 7.}until countdownTimer = 0 step {set countdownTimer to countdownTimer - 1.} do{
        print "...." + countdownTimer.
        wait 1. 
    }
    lock throttle to 1.
    safeStage().
    safeStage().
    wait 3.
}



function ascent{
    lock targetPitch to 88.963 - 1.03287 * alt:radar^0.359511.
    set targetDirection to 90.
    lock steering to heading(targetDirection,targetPitch).
}


function autoStage {
    if ship:availablethrust = 0 {
        lock throttle to 1.
        safeStage().
        safeStage().
        set stagesUsed to stagesUsed + 1.
        wait 1.
    }
}



function turnOffGuidence {
    lock throttle to 0.
    // unlock steering.
    // lock steering to prograde.
    // wait until ship:availablethrust =0.
    // wait until ship:altitude >200000. 
}

function deployParachutes{
    lock steering to retrograde.
    wait until ship:altitude < 10000.
    wait until ship:airspeed < 424.
    safeStage().
    wait until ship:airspeed < 264.
    safeStage().
}

function circulize {
    lock throttle to 0.
    wait until (ship:altitude-ship:apoapsis) / ship:verticalspeed < 10.
    lock steering to prograde.
    until ship:periapsis >100000
    lock throttle to 1.
}


function safeStage{
    wait until stage:ready.
    print "staging".
    stage. 
}




main(). 

