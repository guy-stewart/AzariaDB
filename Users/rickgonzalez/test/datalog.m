// datalog

assert(0, '');

tuple_3(A, A1, 'A->A1').
tuple_3(A, A2, 'A->A2').

tuple_3(A,A2,?string)?
write('tuple_3(A,A2,?) -> ' + string);

tuple_3(?a,A2,?string)?
assert(a==A,'tuple_3(?a,A2,?string)? failed');
write('tuple_3(A,?,?) -> ' + identifier + '  ' + string);


fishbait('IDD_BAIT0').
fishbait('IDD_BAIT1').
fishbait('IDD_BAIT2').
meflintext('meflin_101','this is test meflin for 101').
meflintext('meflin_117','this is test meflin for 117').
meflintext('meflin_198','this is test meflin for 198').

write('QUERY_FACTS: onEntry');
object = 'IDD_BAIT1';
success = fishbait(object);
if (success) {
    write('WOBECT is a fishbait.');
}
b = fishbait(?object);
if (b == 1) {
    write("variable 'object' is now set to :", object);
}
meflintext('meflin_198', ?instructions);
write('the instructions are: ',instructions);

// I don't think this form adds any value since we can detect database tables without the '?' ...
fishbait('IDD_BAIT2')?

fishbait('IDD_BAIT0')~
fishbait('IDD_BAIT1')~
fishbait('IDD_BAIT2')~
meflintext('meflin_1%')~

// drop table? Only work for datalog tables?
// meflintext~

// TODO: work with tables that don't conform to datalog column names ...
write('read sounds table');
success = sounds('SOUND_FIRE',?value,?id);
if (success) {
    write('success',value);
}
