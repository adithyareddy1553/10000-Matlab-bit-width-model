 function [y_f,y_fb] = square_root(x_fb,exp_f,x_f,x_f_double)

% x_fb  = 01.000101111001010110000001;
% exp_f = 1;
% x_f   = 1.092124998569489;
% x_f_double   = [0,1,0,0,0,1,0,1,1,1,1,0,0,1,0,1,0,1,1,0,0,0,0,0,0,1];

for i = 1:64
    n = 100;
    x1(i,1:n) = linspace(((1/64)*(64+(i-1))),((1/64)*(64+i)),n);
    y1(i,1:n) = sqrt(x1(i,1:n));
    p1(i,1:2) = polyfit(x1(i,1:n),y1(i,1:n),1);
end

for i = 1:64
    n = 100;
    x2(i,1:n) = linspace(((2/64)*(64+(i-1))),((2/64)*(64+i)),n);
    y2(i,1:n) = sqrt(x2(i,1:n));
    p2(i,1:2) = polyfit(x2(i,1:n),y2(i,1:n),1);
end

     
exp_fb = decimalToBinaryVector(exp_f);
if exp_fb(1,end) == 1
   m  = (binaryVectorToDecimal(x_f_double(1,3:8)));
else
   m  = (binaryVectorToDecimal(x_f_double(1,2:7)));    
end

if exp_fb(1,end) == 1
    rC1 = p1(m+1,1:1);
    rC0 = p1(m+1,2:2);
else
    rC1 = p2(m+1,1:1);
    rC0 = p2(m+1,2:2);
end    
 
  rC1_b = f_d2b_logn(rC1,12);
  rC0_b = f_d2b_logn(rC0,19);
  
  rC1_d = f_b2d(rC1_b);
  rC0_d = f_b2d(rC0_b);
  
  rD0_d = rC1_d * x_f;
  rD0_b = f_d2b_logn(rD0_d,19);
  rD0   = f_b2d(rD0_b);
  
  y_f   = rD0 + rC0_d;
  y_fbr  = f_d2b_logn(y_f,19);
  
  k1 = find(y_fbr =='.');
  i_part = y_fbr(1:k1);
  f_part = y_fbr(k1+1:k1+19);

switch(k1)
    case 2
        i_part = strcat('000',y_fbr(1:k1));
        
    case 3
        i_part = strcat('00',y_fbr(1:k1));
        
    case 4
        i_part = strcat('0',y_fbr(1:k1));   
      
    case 5
        i_part = strcat(y_fbr(1:k1));     
    
end

      y_fb = strcat(i_part, f_part);
 end
