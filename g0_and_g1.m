function y = g0_and_g1(x)
 
if (x < 0)
  re_b   = f_d2b_logn(-1*x,20);
  k1 = find(re_b =='.');
  i_part = re_b(1:k1);
  f_part = re_b(k1+1:k1+15);

  switch(k1)
    case 2
        i_part = strcat('1',re_b(1:k1));
  end
else
   re_b   = f_d2b_logn(x,20);
   k1 = find(re_b =='.');
   i_part = re_b(1:k1);
   f_part = re_b(k1+1:k1+15);

   switch(k1)
    case 2
        i_part = strcat('0',re_b(1:k1));    
    end    
end
 y = strcat(i_part, f_part);
end