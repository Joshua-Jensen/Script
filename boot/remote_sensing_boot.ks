runOncePath("0:/lib/launch_lib.ks").

wait 2.
clearScreen.
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").

countdown().
lock throttle to 1.

