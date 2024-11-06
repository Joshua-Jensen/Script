global function makeBiSectSolver{
    parameter scoreFunction, testPoint1, testPoint2.

    local testPoints is list().
    local score1 is scoreFunction:call(testPoint1).
    local score2 is scoreFunction:call(testPoint2).
    
}