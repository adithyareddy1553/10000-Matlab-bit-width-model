function e_b = natlog_range_reduction(y_e, exp_e)

ln2_d = log(2);
ln2_b = f_d2b_logn(ln2_d,32);

rln2  = f_b2d(ln2_b);

re1    = exp_e * rln2;
re1_b  = f_d2b_logn(re1,28);

e1     = f_b2d(re1_b);

re     = (e1 - y_e)*2;
re_b   = f_d2b_logn(re,24);

k1 = find(re_b =='.');
i_part = re_b(1:k1);
f_part = re_b(k1+1:k1+24);

switch(k1)
     case 1
        i_part = strcat('0000000',re_b(1:k1));
      
    case 2
        i_part = strcat('000000',re_b(1:k1));
        
    case 3
        i_part = strcat('00000',re_b(1:k1));
        
    case 4
        i_part = strcat('0000',re_b(1:k1));   
      
    case 5
        i_part = strcat('000',re_b(1:k1));     
    
    case 6
        i_part = strcat('00',re_b(1:k1));        

    case 7
        i_part = strcat('0',re_b(1:k1)); 
    
    case 8
        i_part = strcat(re_b(1:k1));     
end

   e_b = strcat(i_part, f_part);
end