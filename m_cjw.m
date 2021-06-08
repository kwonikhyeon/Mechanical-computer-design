clc 
clear all
close all

%% Time condition
T = 1; 
dt = 0.01;
SumT =14 ;
t = [0:dt:T-dt];
tt = [0:dt:SumT-dt];
L = length(t);


%% standard
c1 = 202;
c2 = 372;
c3 = 202;

x0_1 = 574;
x1_3 = 700;
x5_6 = 700;
y0_1 = 0;
y1_3 = 2;
y5_6 = 0;

%% x-z 3_mortor_control
syms x y

for i = 1:1:3
    if i==1
        xi = x0_1;
        yi = y0_1;
    elseif i==2
        xi = x1_3;
        yi = y1_3;
    else
        xi = x5_6;
        yi = y5_6;
    end
    alpha = subs(atan(y/x), [x, y], [xi, yi]);
    esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);
    gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));
    thetaB(i) = subs(acos((x-c2*cos(alpha))/esp), x, xi) - gamma;
end

thetaB = thetaB * 180 / pi;
thetaA = (thetaB + alpha);

%% data toss

mortor_zx = [linspace(0,thetaA(1),L) linspace(thetaA(1),thetaA(2),2*L) linspace(thetaA(2),80,L) 80*ones(1,L) linspace(80, thetaA(3),L) thetaA(3)*ones(1,2*L) linspace(thetaA(3), 80,L) 80*ones(1,L) linspace(80,thetaA(2),L)  linspace(thetaA(2),thetaA(1),2*L) linspace(thetaA(1),0,L)  ];
mortor_zx2 = [linspace(0,thetaB(1),L) linspace(thetaB(1),thetaB(2),2*L) linspace(thetaB(2),20,L) 20*ones(1,L) linspace(20, thetaB(3),L)  thetaB(3)*ones(1,2*L) linspace(thetaB(3), 20,L) 20*ones(1,L) linspace(20,thetaB(2),L)  linspace(thetaB(2),thetaB(1),2*L) linspace(thetaB(1),0,L)];
mortor_zx3 = [linspace(0,thetaB(1),L) linspace(thetaB(1),thetaB(2),2*L) linspace(thetaB(2),20,L) 20*ones(1,L) linspace(20, -thetaB(3),L) -thetaB(3)*ones(1,2*L) linspace(-thetaB(3), 20,L) 20*ones(1,L) linspace(20,thetaB(2),L)  linspace(thetaB(2),thetaB(1),2*L) linspace(thetaB(1),0,L)];
mortor_zx4 = [linspace(0,90,L) linspace(90,160,2*L) linspace(160,50,L) linspace(50,40,L) linspace(40,90,L) 90*ones(1,2*L) linspace(90,40,L) linspace(40,50,L) linspace(50,160,L) linspace(160,90,2*L) linspace(90,0,L) ];

mortor_xy = [zeros(1, 4*L) linspace(0,10,2*L) 10*ones(1,2*L) linspace(10,0,2*L) zeros(1, 4*L) ];
mortor_xy2 = [zeros(1, 4*L) linspace(0,20,2*L) 20*ones(1,2*L) linspace(20,0,2*L) zeros(1, 4*L) ];
mortor_xy3 = [zeros(1, 4*L) linspace(0,20,2*L) 20*ones(1,2*L) linspace(20,0,2*L) zeros(1, 4*L)];
mortor_xy4 = zeros(1,14*L);

mortor_body2 = [zeros(1,3*L) linspace(0,90,L) 90*ones(1,6*L) linspace(90,0,L) zeros(1,3*L)];

grab =[zeros(1,5*L) linspace(0,45,L/2) linspace(45,0,L/2) zeros(1,2*L)  linspace(0,45,L/2)  linspace(45,0,L/2) zeros(1,5*L)];
%% soild toss
mortor_zx = [tt' mortor_zx'];
mortor_zx2 = [tt' mortor_zx2'];
mortor_zx3 = [tt' mortor_zx3'];
mortor_zx4 = [tt' mortor_zx4'];

mortor_xy = [tt' (mortor_xy)'];
mortor_xy2 = [tt' (mortor_xy2)'];
mortor_xy3 = [tt' (mortor_xy3)'];
mortor_xy4 = [tt' (mortor_xy4)'];

mortor_body2 = [tt' mortor_body2'];

grab = [tt' grab'];

dlmwrite('mortor_zx.txt', mortor_zx, 'precision','%.6f')
dlmwrite('mortor_zx2.txt', mortor_zx2, 'precision','%.6f')
dlmwrite('mortor_zx3.txt', mortor_zx3, 'precision','%.6f')
dlmwrite('mortor_zx4.txt', mortor_zx4, 'precision','%.6f')
dlmwrite('mortor_xy.txt', mortor_xy, 'precision','%.6f')
dlmwrite('mortor_xy2.txt', mortor_xy2, 'precision','%.6f')
dlmwrite('mortor_xy3.txt', mortor_xy3, 'precision','%.6f')
dlmwrite('mortor_xy4.txt', mortor_xy4, 'precision','%.6f')
dlmwrite('mortor_body2.txt', mortor_body2, 'precision','%.6f')
dlmwrite('grab.txt', grab, 'precision','%.6f')
