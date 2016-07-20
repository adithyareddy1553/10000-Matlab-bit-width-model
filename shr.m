function y = shr(x,u0);
 y = [zeros(1,x),u0(1,(1 : end-x))];
end