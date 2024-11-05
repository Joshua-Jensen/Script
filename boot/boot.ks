// runPath("0:/basickaunch.ks").
core:part:getmodule("kOSProcessor"):doevent("Open Terminal").
switch to 0.
run "basicLaunch.ks".

// set wd to scriptPath():volume:name + ":/"+scriptPath():parent:segments:join("/").
// cd(wd).

print "witing for ship to unpack".
wait until ship:unpacked.
print "ship is unpacked".

