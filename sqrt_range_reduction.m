function [x_f,exp_f,x_fd,zd,x_f_double] = sqrt_range_reduction(e_b,e_d)

% e_b = '0000100.010111100101011000000100';
% e_b = '.100111010001101101110001';
% e_d = 4.368499994277954;

k = find(e_b =='.');
i_part = e_b(1:k-1);
f_part = e_b(k+1:end);

q = strcat(i_part,f_part);

for i = 1:31
    dbl_e(1,i:i) = str2double(q(i));
end

 zd = LeadingZeroDet(dbl_e);

if zd <= 5
    exp_f = 5-zd;
    x_fr = shr(exp_f,dbl_e);
    exp_fb = decimalToBinaryVector(exp_f);
    
elseif zd == 6
    exp_f = 0;
    x_fr = dbl_e;
    exp_fb = decimalToBinaryVector(exp_f);
    
elseif zd > 6
    exp_f = zd - 5;
    x_fr  = shl(exp_f,dbl_e);
    exp_fb = decimalToBinaryVector(exp_f);
end   

if exp_fb(1,end) == 1
    x_fn   = shr(1, x_fr);
else
    x_fn   = x_fr;
end    
    x_fb    = x_fn(1,6:end);
    
    t   = 0;
  for f = 1:24
     if(x_fb(1,f+2:f+2))
     t = t + 2^-(f);
     else
     t = t + 0;
     end
  end
  
  t1   = b2d(x_fb(1,1:2));
  x_fd = t1+t;
  
  for i = 1:26
   y(i) = num2str(x_fb(1,i:i));
  end
  x_f_double = x_fb;
  
  x_f  = strcat(y(1:2),'.',y(3:end));
end