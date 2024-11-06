    //REVIEW - check if this makes sense
global function countdown{
    parameter hasClamps is false.
    print"counting down".
    from {local countdownTimer is 7.}until countdownTimer = 0 step {set countdownTimer to countdownTimer - 1.} do{
        print "...." + countdownTimer.
        wait 1. 
    }
    lock throttle to 1.
    safeStage().
    if hasClamps {
        wait 1.
        safeStage().
    }
}

global function ascentProfile{
    //TODO - take paramater of target apopapsis create profile for this apopasis
}

global function computeLaunchWindow{
    //TODO - find the optimal time to launch / calculate when to make manuver
}

global function circulize{
    //TODO - take paramater of periapsis calculate manauver to circulize orbit 
    // execute the circularization
}

global function safeStage{
    wait until stage:ready.
    print "staging".
    stage. 
}

//SECTION - maybe pid function here for acceleration
global function accelPID{
    //NOTE - take in paramater for local body's gravity
    parameter localG.
    parameter bodyRadius.
    set g to localG/bodyRadius^2.
    lock accVec to ship:sensors:acc-ship:sensors:grav.
    lock gForce to accVec:mag / g.
    lock dThrottle to .05 *(1.2-gForce).

    set newThrottle to 1.
    lock throttle to newThrottle.

    // until not inLoop{
    //     set newThrottle to newThrottle+dThrottle.
    //     wait 0.1.
    // } 
}


