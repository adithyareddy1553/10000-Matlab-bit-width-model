 function [y,yb] = CosSin(z)

for i = 1:128
    n = 100;
    x(i,1:n)  = linspace(((1/128)*(i-1)),((1/128)*(i)), n);
    y(i,1:n)  = cos((pi/2)*x(i,1:n));
    p(i,1:2)  = polyfit(x(i,1:n),y(i,1:n),1);
end
    x_g       = z;
    x_g_ab    = x_g(1,1:7);
    m         = (binaryVectorToDecimal(x_g_ab));
    rC1_d     =  -1*p(m+1,1);
    rC0_d     =  p(m+1,2);

% Convert input to decimal
   t          =  0; 
   for f = 1:7
      if(z(1,f:f))
       t = t + 2^-f;
      else
       t = t + 0;
      end
    end            
   x_g_ad    = t;    
   
   rC1_b     = f_d2b_logn(rC1_d,18);
   rC1       = f_b2d(rC1_b);
   
   rDO_d     = rC1 * x_g_ad;
   rDO_b     = f_d2b_logn(rDO_d,18);
   rD0       = f_b2d(rDO_b);
   
   rC0_b     = f_d2b_logn(rC0_d,18);
   rC0       = f_b2d(rC0_b);
   
   y         = rC0 - rD0;
   yb        = f_d2b_logn(y,15);
end
     


