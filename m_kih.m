clc
clear all
close all

%% arm_length
c1 = 202;
c2 = 372;
c3 = 202;
%% 주기
T = 2; %모션 하나의 주기
dt = 0.01;
t = [0:dt:T-dt];
L = length(t);
tt = [0:dt:5*(T+1.5)-dt]; %총 모션시간
%% 좌표 경로1(x,z)
x1 = linspace(388, 776, L);
x1 = fliplr(x1);
Lx1 = length(x1);

p1_1 = [776 0];
p1_2 = [388 388];
gp1_1 = -2;
gp1_2 = 0;

syms XY

s = [XY^3 XY^2 XY 1];
det_s = diff(s);
% subs(det_s, XY, 1);

M1 = [subs(s, XY, p1_1(1));
    subs(s, XY, p1_2(1));
    subs(det_s, XY, p1_1(1));
    subs(det_s, XY, p1_2(1))];

P1 = [p1_1(2);p1_2(2);gp1_1;gp1_2];

P1 = M1\P1;
for i=1:Lx1
    p1(i) = P1(1)*x1(i)^3 + P1(2)*x1(i)^2 + P1(3)*x1(i) + P1(4);
end

% plot(x1, p1)
%% 좌표1에 대한 각도

for i=1:L
    alpha = atan(p1(i)/x1(i));
    esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);
    gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));
    thetaB1(i) = acos((x1(i)-c2*cos(alpha))/esp) - gamma;
    thetaB1_dig(i) = thetaB1(i) * 180 / pi;
    thetaA1(i) = thetaB1(i) + alpha;
    thetaA1_dig(i) = thetaA1(i) * 180 / pi;
end



%% 좌표 경로2(x,z)
x2 = linspace(300, 388, L);
x2 = fliplr(x2);
Lx2 = length(x2);

p2_1 = [388 388];
p2_2 = [300 0];
gp2_1 = 0;
gp2_2 = 5;

M2 = [subs(s, XY, p2_1(1));
    subs(s, XY, p2_2(1));
    subs(det_s, XY, p2_1(1));
    subs(det_s, XY, p2_2(1))];

P2 = [p2_1(2);p2_2(2);gp2_1;gp2_2];

P2 = M2\P2;
for i=1:Lx2
    p2(i) = P2(1)*x2(i)^3 + P2(2)*x2(i)^2 + P2(3)*x2(i) + P2(4);
end

% plot(x2, p2)
%% 좌표2에 대한 각도
for i=1:L
    alpha = atan(p2(i)/x2(i));
    esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);
    gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));
    thetaB2(i) = acos((x2(i)-c2*cos(alpha))/esp) - gamma;
    thetaB2_dig(i) = thetaB2(i) * 180 / pi;
    thetaA2(i) = thetaB2(i) + alpha;
    thetaA2_dig(i) = thetaA2(i) * 180 / pi;
end

%% 좌표 경로3(x,z)
x3 = linspace(388, 600, L);

Lx3 = length(x3);

p3_1 = [388 388];
p3_2 = [600 100];
gp3_1 = 0;
gp3_2 = -3;

M3 = [subs(s, XY, p3_1(1));
    subs(s, XY, p3_2(1));
    subs(det_s, XY, p3_1(1));
    subs(det_s, XY, p3_2(1))];

P3 = [p3_1(2);p3_2(2);gp3_1;gp3_2];

P3 = M3\P3;
for i=1:Lx3
    p3(i) = P3(1)*x3(i)^3 + P3(2)*x3(i)^2 + P3(3)*x3(i) + P3(4);
end

plot(x3, p3)
%% 좌표3에 대한 각도
for i=1:L
    alpha = atan(p3(i)/x3(i));
    esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);
    gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));
    thetaB3(i) = acos((x3(i)-c2*cos(alpha))/esp) - gamma;
    thetaB3_dig(i) = thetaB3(i) * 180 / pi;
    thetaA3(i) = thetaB3(i) + alpha;
    thetaA3_dig(i) = thetaA3(i) * 180 / pi;
end

%% 좌표 경로4(x,z)
x4 = linspace(600, 776, L);

Lx4 = length(x4);

p4_1 = [600 100];
p4_2 = [776 0];
gp4_1 = 0;
gp4_2 = 0;

M4 = [subs(s, XY, p4_1(1));
    subs(s, XY, p4_2(1));
    subs(det_s, XY, p4_1(1));
    subs(det_s, XY, p4_2(1))];

P4 = [p4_1(2);p4_2(2);gp4_1;gp4_2];

P4 = M4\P4;
for i=1:Lx4
    p4(i) = P4(1)*x4(i)^3 + P4(2)*x4(i)^2 + P4(3)*x4(i) + P4(4);
end

plot(x3, p3)
%% 좌표4에 대한 각도
for i=1:L
    alpha = atan(p4(i)/x4(i));
    esp = sqrt((cos(alpha)*(c1+c3))^2 + (sin(alpha)*(c1-c3))^2);
    gamma = atan(sin(alpha)*(c1-c3)/(cos(alpha)*(c1+c3)));
    thetaB4(i) = acos((x4(i)-c2*cos(alpha))/esp) - gamma;
    thetaB4_dig(i) = thetaB4(i) * 180 / pi;
    thetaA4(i) = thetaB4(i) + alpha;
    thetaA4_dig(i) = thetaA4(i) * 180 / pi;
end

%% 경로 그리기
x_all = [x1 x2 x3 x4];
p_all = [p1 p2 p3 p4];
figure;
axis([0 800 0 800])
plot(x_all, p_all)

%% 끝각도
thetaC = zeros(1,1750);
thetaC(201:400) = linspace(0,90,L);
thetaC(401:1500) = 90;
thetaC(1501:1700) = linspace(90,0,L);

%% XY평면
thetaB_1 = zeros(1,1750);
thetaB_1(801:1000) = linspace(0,-40,L);
thetaB_1(1001:1300) = -40;
thetaB_1(1301:1500) = linspace(-40,0,L);

thetaB_2 = zeros(1,1750);
thetaB_2(801:1000) = linspace(0,30,L);
thetaB_2(1001:1300) = 30;
thetaB_2(1301:1500) = linspace(30,0,L);
%% 집게
grab = zeros(1,1750);
grab(1:200) = linspace(0,50,L);
grab(201:1500) = 50;
grab(1501:1700) = linspace(50,0,L);

%% 데이터 생성
stopA1 = zeros(1,100)+thetaA2_dig(L);
stopB1 = zeros(1,100)+thetaB2_dig(L);
stopA2 = zeros(1,200)+thetaA3_dig(L);
stopB2 = zeros(1,200)+thetaB3_dig(L);

Atxt = [tt;zeros(1,200) thetaA1_dig thetaA2_dig stopA1 fliplr(thetaA2_dig) thetaA3_dig stopA2 thetaA4_dig zeros(1,250)]';
Btxt = [tt;zeros(1,200) thetaB1_dig thetaB2_dig stopB1 fliplr(thetaB2_dig) thetaB3_dig stopB2 thetaB4_dig zeros(1,250)]';
Ctxt = [tt;thetaC]';
B_1txt = [tt;thetaB_1]';
B_2txt = [tt;thetaB_2]';
grabtxt = [tt;grab]';
dlmwrite('thetaA.txt', Atxt)
dlmwrite('thetaB.txt', Btxt)
dlmwrite('thetaC.txt', Ctxt)
dlmwrite('thetaB_1.txt', B_1txt)
dlmwrite('thetaB_2.txt', B_2txt)
dlmwrite('grab.txt', grabtxt)

