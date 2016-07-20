function y = mult_reconst(x)
 
if (x < 0)
  re_b   = f_d2b_logn(-1*x,20);
  k1 = find(re_b =='.');
  i_part = re_b(1:k1);
  f_part = re_b(k1+1:k1+11);

  switch(k1)
    case 2
        i_part = strcat('1000',re_b(1:k1));
        
    case 3
        i_part = strcat('100',re_b(1:k1));
        
    case 4
        i_part = strcat('10',re_b(1:k1));   
      
    case 5
        i_part = strcat('1',re_b(1:k1));     
  end
else
   re_b   = f_d2b_logn(x,20);
   k1 = find(re_b =='.');
   i_part = re_b(1:k1);
   f_part = re_b(k1+1:k1+11);

   switch(k1)
    case 2
        i_part = strcat('0000',re_b(1:k1));
        
    case 3
        i_part = strcat('000',re_b(1:k1));
        
    case 4
        i_part = strcat('00',re_b(1:k1));   
      
    case 5
        i_part = strcat('0',re_b(1:k1));     
  end    
end
 y = strcat(i_part, f_part);
end
