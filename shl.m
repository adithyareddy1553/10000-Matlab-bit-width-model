function y = shl(x,u0);
 y = [u0(1,(x+1 : end)), zeros(1,x)];
end