function [dig] = numtodig(n)
%NUMTODIG turns number into list of digits

dig = [];

while (n>0)
    dig =  [mod(n,10) dig]; % get the last digit of n
    n = floor(n/10); % knock the last digit off n
end
end

