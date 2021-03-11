function n = Beautisqnum(N) 
%BEAUTISQNUM returns a beautiful square number n, where n^2 is closest to the input N.
%   
%   The square, n^2, of a beautiful square number n consists of all the non-zero
%   digits from 1 to 9 exactly once. This means each digit is distinct. 
%
%   Input: N - assume N to be in the range 10^8 <= N < 10^9.
%   Output: n - Beautiful square number. 


beaut_nums = zeros(1, 30);
i = 0;

for x = sqrt(10^8):sqrt(10^9)
    squared = x^2;
    digits = numtodig(squared);
    
    if length(unique(digits)) == length(numtodig(digits)) % checks if the digits do not repeat
        
        if find(digits == 0)
            continue
        end
        
        i = i + 1;
        beaut_nums(i) = squared;    % mutate the initialized variable beaut_nums https://uk.mathworks.com/matlabcentral/fileexchange/8334-incremental-growth-of-an-array-revisited
    end
end

diff = abs(beaut_nums-N);           % take the absolute value of the difference

pos = diff == min(diff);            % find the position of the minimum difference

n_squared = beaut_nums(pos);        % the position is the closest n^2 to N in the beaut_num variable

n = sqrt(n_squared);