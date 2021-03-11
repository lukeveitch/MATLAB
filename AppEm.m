function [p,q] = AppEm(N)
    % APPEM finds the smallest integer values p, q such that the absolute value
    %   of p/q is the best approximation for the Euler-Mascheroni constant, where
    %   p+q<=N.
%
%   Input: N - Assumes input is always a positive integer.
%   Outputs: p,q - positive integers.
%
%   1) Declare the variables P, emconst and bestapprox.
%   2) Work out a base case for the computation abs(P./(1:N-P)-emconst).
%       - Set the outputs p = 1 and q = 2. 
%       - P./(1:N-P) divides each element of P in the range 1 up to N-P.
%       - up to N-P as p+q<=N.
%   3) Enter a while loop on the condition that P less than N-1 and the
%   length of the array is greater than 2. 
%   4) Compute abs(P./(P+1:N-P)-emconst) and store it in arr. The range is now from P+1 as the base already
%   checked the case when p=q.
%   5) Store the smallest value in arr, using the min() function into a
%   variable named smallest. 
%   6) If the smallest value is less than bestapprox then update
%   bestapprox. Take note of the positions p and q.
%       - p is equal to P.
%       - To work out q, find the position in the arr and add P to account
%         for the the values taken away from the beginning of arr. (When
%         the range from 1 to P+1 up to N-P)
%   7) If the smallest is not greater than bestapprox then increment P.


    % Declare variables
    P = 1;
    emconst = 0.577215664901533;
    bestapprox = intmax; % insures that on the first iteration, the smallest value will 
    % always be smaller than the largest possible integer value in MATLAB.
    
    % Base  case 
    arr = abs(P./(1:N-P) - emconst);
    p = 1; q = 2;
    
    while P <= N-1 && length(arr) > 2 % length(arr) > 2 stops iterating over empty arrays
        
        arr = abs(P./(P+1:N-P) - emconst); % from P+1, as already checked the case when p = q in base case, to N-P due to Q+P <= N
        smallest = min(arr);
        
        if smallest < bestapprox % if find new best estimate update bestapprox, p and q. 
            bestapprox = smallest; 
            p = P;
            q = find(arr == min(arr)) + P; % find(arr == min(arr)) finds the position in array with the smallest value, 
            % + P to account for the values we took away from the beginning of the array.
        end
        P = P+1;
    end
end