
function b = dbl2bin(f)
%This function converts a floating point number to its binary form.

%Input error handling
if ~isfloat(f)
  disp('Input must be a floating point number.');
  return;
end

%Hex characters
hex = '0123456789abcdef'; 

%Convert from float to hex
h = num2hex(f); 

%Convert to cell array of chars
hc = num2cell(h); 

%Convert to array of numbers
nums =  cellfun(@(x) find(hex == x) - 1, hc); 

%Convert to array of binary numbers
bins = dec2bin(nums, 4); 

%Reshape into horizontal vector
b = reshape(bins.', 1, numel(bins));