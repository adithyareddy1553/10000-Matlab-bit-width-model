load taus_output1.txt,'-ascii';
load taus_output2.txt,'-ascii';

N = 10000;

%Initialising
ox0 = zeros([N,1]);
ox1 = zeros([N,1]);

%Initialising
 for i = 1:N
    disp(i);
     ox0_b(i,1:17) = '00000000000000000';
     ox1_b(i,1:17) = '00000000000000000';
 end

for i = 1:N
    disp(i);
    [ox0(i,1:1), ox1(i,1:1), ox0_b(i,1:17), ox1_b(i,1:17)] = Boxmuller_Emu_function(taus_output1(i,1), taus_output2(i,1));
end