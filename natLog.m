function y_e = natLog(q)
%q = [1,1,1,1,1,1,1,1,1,0,0,1,1,0,1,0,0,0,0,0,0,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,0,1,1,1,0,0,1,1,0;]
for i = 1 : 256
    n = 100;
    x(i,1:n) = linspace(((1/256)*(256+(i-1))),((1/256)*(256+i)), n);
    y(i,1:n) = -1*log(x(i,1:n));
    p(i,1:3) = polyfit(x(i,1:n),y(i,1:n),2);
end

for i = 1 : 256
    n = 100;
    x1(i,1:n) = linspace(((1/256)*(256+(i-1))),((1/256)*(256+i)), n);
    y1(i,1:n) = -1*log(x1(i,1:n));
    p1(i,1:3) = polyfit(x1(i,1:n),y1(i,1:n),2);
end

% x  = [1,1,1,0,0,1,1,0,1,1,1,0,0,0,1,0,1,1,0,1,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,1,0,0,1,0,0,1,0,0,0,0,0,0];
m  = (binaryVectorToDecimal(q(1,2:9)));
p1 = p(m+1,1:1);
p2 = p(m+1,2:2);
p3 = p(m+1,3:3);

t   = 0;
  for f = 1:8
     if(q(1,f+1:f+1))
     t = t + 2^-(f);
     else
     t = t + 0;
     end
  end
  
if q(1,1) == 1
    t1 = 1;
else
    t1 = 0; 
end  

rR      = t1 + t;
rC2_b   = f_d2b_logn(p1,13);
rC2     = f_b2d(rC2_b);
rDC2    = rR*rC2;

rC1_b   = f_d2b_logn(-1*p2,22);
rC1     = f_b2d(rC1_b);
rDC1    = rC1 - rDC2;

rDC0_m   = rDC1*rR;
rDC0_b   = f_d2b_logn(rDC0_m,30);
rDC0     = f_b2d(rDC0_b);

rData1_b = f_d2b_logn(p3,22);
rData1   = f_b2d(rData1_b);  

rYe_s      = rDC0 - rData1;
rYe_b      = f_d2b_logn(rYe_s,27);
y_e        = f_b2d(rYe_b);
end
