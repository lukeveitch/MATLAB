function n = MyLuckynum(N)
%MYLUCKYNUM returns the first Lucky number greater than or equal to N.
%
%   A Lucky number is a number which has only odd, distinct primes. 
%   All of its primes p, must satisfy the equation (N-1)/(p-1).
%   Uses a while loop, which breaks at the first occurence of a MyLucky number. 
%   1) check if N is prime. If this is the case, increment N and move on to next
%   iteration using continue.  
%   2) Find the factors of N
%   3) Check to see that the prime factors are odd. The only even prime
%   factor is 2, so check if factors == 2 using the find() function. If 2 is a 
%   prime factor, increment N and move on to next iteration using continue.
%   4) Check that the factors are distinct. If they are not, increment N
%   and continue. 
%   5) Finally, check that there is no remainder from N-1 divided by the
%   factors-1. If not, increment N. 
%   If all these cases are met, the algorithm has found a Lucky number. Return n = N.

    
    while N>0
        
        if isprime(N)                                     % we do not want to check the prime numbers as they have no factors beside themselves and 1
            N = N +1;
            continue
        end   
        
        factors = factor(N);     % factors of N.
        
        if find(factors == 2)    % check the prime factors are odd. The only even prime factor is 2.
            N = N +1;continue
        elseif length(factors) ~= length(unique(factors)) % check that there are no duplicate prime factors.
            N = N +1;
            continue
        end
                    
        a = N-1;
        b = factors - 1;
    
        comp = rem(a,b);  % remainder of N-1 by factors-1.
        
        if comp == 0    % check that there is no remainder from N-1 divided by the factors-1. 
            n = N;
            break
        else
            N = N +1;   % If there is, then increment N.
        end
    end
end