
function [ox0, ox1, ox0_b, ox1_b] = Boxmuller_Emu_function(x1,x2)
%----------------------------Generate u0 and u1---------------------------%
%mex taus.c;

%inta = taus(1999,2995,3666);
%intb = taus(3658,1564,4578);
% 
% x1 = 1.684213211000000e+09
% x2 = 3.001987723000000e+09;

inta =  uint32(x1);
intb =  uint32(x2);

hexa = dec2hex(inta);
hexb = dec2hex(intb);

bina  = hexToBinaryVector(hexa);
binb  = hexToBinaryVector(hexb);

[m1,n1] = size(bina);
[m2,n2] = size(binb);

if(n1 < 32)
    a  = [zeros(1,32-n1),bina];
else
    a  = bina;
end
    
if(n2 < 32)
    b  = [zeros(1,32-n2), binb];
else
    b  = binb;
end

u0 = [a, b(1:16)];
u1 = b(17:32);
%---------------------------Evaluate e = -2ln(u0)-------------------------%
exp_e    =    LeadingZeroDet(u0) + 1;
ubuff    =    [0,u0];
x_e      =    shl(exp_e, ubuff);

%Approximate -ln(x_e)
y_e      =     natLog(x_e);

%Range Reconstruction
e_b        =   natlog_range_reduction(y_e, exp_e);
e_d        =   f_b2d(e_b);
%-------------------------Evaluate f = sqrt(e)----------------------------%
[x_fb,exp_f,x_f,zd,x_f_double]  =   sqrt_range_reduction(e_b,e_d);

%Approxiamte sqrt(x_f) where x_f = [1,4)
[y_f,y_fb]                   =   square_root(x_fb,exp_f,x_f,x_f_double);

%Range reconstruction
[f,fb]                       =   sqrt_range_reconst(y_f,y_fb,zd);

%-------------------------Evaluate g0 = sin(2*pi*u1)----------------------%
%-------------------------         g0 = sin(2*pi*u1)----------------------%

%Range reduction
quad      =     b2d(u1(1:2));
x_g_a     =     u1(3:16);
x_g_b     =     sub(logical(x_g_a));

[y_g_a,y_g_ab]     =     CosSin(x_g_a);
[y_g_b,y_g_bb]     =     CosSin(x_g_b);

%-------------------------approximating cos and sin-----------------------%


%Range Reconstruction
 switch(quad)
    case  0
          g0    =   y_g_b;
          g1    =   y_g_a;
          
    case  1
          g0    =    y_g_a;
          g1    =   -y_g_b;
    
    case  2
          g0    =   -y_g_b;
          g1    =   -y_g_a;
    
     case 3         
          g0    =   -y_g_a;
          g1    =    y_g_b; 
 end
%-------------------------Compute x0 and x1-------------------------------%
ox0 = f*g0;
ox1 = f*g1;

ox0_b = mult_reconst(ox0);
ox1_b = mult_reconst(ox1);

 end



