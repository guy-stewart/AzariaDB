

success = 1;
assert(success, 'failure');

warp('IDV_FALTAR');
setsleep(2);

fish='IDD_FISH1';
ash='IDD_FISHASH1';
drop(S11_FIRE, IDD_LOG);
get(IDD_MATCH);
drag(S11_FIRE);
drop(SMP_RECYCLE);
drop('S11_GRILL',fish);
sleep(16);
grab('S11_GRILL');
object = got();
success = (object == ash);
assert(success, 'failed to get' + ash);

replay('city/lockup');
recycle();

fish='IDD_FISH2';
ash='IDD_FISHASH2';
drop('S11_FIRE', 'IDD_LOG');
drag('S11_FIRE', 'IDD_MATCH');
drop('S11_GRILL',fish);
sleep(16);
grab('S11_GRILL');
object = got();
success = object == ash;
assert(success, 'failed on ' + fish);

replay('city/lockup');
drop(SMP_RECYCLE);
