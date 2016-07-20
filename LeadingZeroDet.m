function y = LeadingZeroDet(x)

 p1 = x;
 j = 0;
for i = 1:48
    if(p1(1,i))
        break;
    else
        j = j+1;
    end
end
    y = j;
   
end