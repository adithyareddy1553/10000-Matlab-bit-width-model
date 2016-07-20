function y = shift_left(d,s)
yb  = decimalToBinaryVector(d);
[m,n] = size(yb);
y_1 = [zeros(1,6-n), yb];
ryb1 = shr(s,y_1);

t = 0;
for i = 6:-1:1
    if(ryb1(1,i))
       t = t + 2^(6-i);
    else
       t = t + 0;
    end
end
y = t;
end
    
    
    