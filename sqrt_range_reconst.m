function [f,fb] = sqrt_range_reconst(y_f,y_fb,zd)

% y_f  = 1.04496955871582;
% y_fb = '0001.0000101110000101000';
% zd   = 4;
k = find(y_fb =='.');
i_part = y_fb(1:k-1);
f_part = y_fb(k+1:end);

q = strcat(i_part,f_part);

for i = 1:23
    dbl_e(1,i:i) = str2double(q(i));
end

if zd <= 5
    exp_f = 5-zd;
    exp_fb = decimalToBinaryVector(exp_f);
    if exp_fb(1,end) == 1
        rexp_f  = (exp_f + 1);
       exp_fr  = shift_left(rexp_f,1);
        rf       = shl(exp_fr,dbl_e);
      %  rf       = shl(1,dbl_e);
    else
        rexp_f  = exp_f;
        exp_fr  = shift_left(rexp_f,1);
        rf       = shl(exp_fr,dbl_e);
    end     
 
elseif zd == 6
    exp_fr = 0;
    rf      = dbl_e;
    
elseif zd > 6
    exp_f = zd - 5;
    exp_fb = decimalToBinaryVector(exp_f);
    if exp_fb(1,end) == 1
        rexp_f  = (exp_f);
        exp_fr  = shift_left(rexp_f,1);
        rf       = shr(exp_fr,dbl_e);
    else
        rexp_f  = (exp_f);
        exp_fr  = shift_left(rexp_f,1);
        rf       = shr(exp_fr,dbl_e);  
    end   
end   

 for i = 1:23
   y(i) = num2str(rf(1,i:i));
 end
  
  fb  = strcat(y(1:4),'.',y(5:end-6));
  f   = f_b2d(fb);

end