
numvar = 1234567;
newvar = numvar + 1;
write("newvar = ", newvar);

numvar = '0x9';
newvar = numvar + 1;
write("newvar = ", newvar);


write('
    1. test write
    2. test multiple lines
    3. at least 3 lines'
    + "
    4. Don't forget to add a 4th item."
    + '
    5. add a numeric variable like so ...
    '
    + numvar
);

hexval = '0x12345';
write('hexval = ',hexval);
write('hexval = ' + hexval);
write(t + ' and also ' + n + ' this is end.');

mynewvar = t + ' and also ' + n + ' this is end.';

write(hexval);

t = 'fivehundred::';
n = 500;
s = t + n;
write(t,'+',n,' --> ',s);

true =1;
false=0;

assert(false, 'false is equal to ' + false);