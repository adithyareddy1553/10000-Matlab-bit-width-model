function y = sub(x)
        
         if( ~islogical(x))
             fprintf('input is not a logical number'); 
         else
             y1 = hexToBinaryVector('3FFF');
             y  = [y1] - [x];
         end
         
         
end


% for i = 1:128
%     n = 100;
%     x(i,1:n) = linspace((((pi/2)*(1/128))*(i-1)),(((pi/2)*(1/128))*(i)),n);
%     y(i,1:n) = cos(x(i,1:n));
%     p(i,1:2) = polyfit(x(i,1:n),y(i,1:n),1);
%     q(i,1:1) = -1*p(i,1:1);
% end   
% 
% for  t  = 1:128
%      c    =   f_d2b(q(1,1));
%      k1    =  find(c =='.');
%      C1g   =  c(k1+1:k1+13);
% end
%     
%     s0    =  '0.';
%     C1gx    =  strcat(s0,C1g);
%     C1gd    =  f_b2d(C1gx);