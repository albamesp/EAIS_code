% Solutions to EAIS SMB anomalies from different RCM
close all, clear all, clc

% cd('O:\Documents\RATES\R Code\img\zwally\EGU\paper')
% R_new = xlsread('results_EAISpaper_zw.xls');
% n = 1:10; 
% n3 = repmat(n,1,11); 
% b=zeros(25,1);c2=[n3';b];
% R_new = R_new(1:135,:);
% R_new = [c2,R_new];
% clear  n3 b c2
 
cd('O:\Documents\RATES\R Code\img\zwally\EGU\paper')
R_new28 = xlsread('FINALresults_EAISpaper_zw28.xls');
n = 1:10; 
n3 = repmat(n,1,11); 
b=zeros(25,1);c2=[n3';b];
R_new28 = R_new28(1:135,:);
R_new28 = [c2,R_new28];
clear  n3 b c2

T2_smb=R_new28(find(R_new28(:,1)==4),5:6); sig2_smb=[T2_smb(:,1)+0.2*T2_smb(:,1), T2_smb(:,1)-0.2*T2_smb(:,1)];
T2_ice=R_new28(find(R_new28(:,1)==5),5:6); sig2_ice=[T2_ice(:,1)+T2_ice(:,2), T2_ice(:,1)-T2_ice(:,2)];

%Rcm4 = xlsread('results_EAISpaper_zwracmo4.xls');
Rcm4 = xlsread('FINALresults_with_racmo2.4_28yr.xls');
n = 1:6; 
n3 = repmat(n,1,11); 
Rcm4_res = Rcm4(1:66,:);
Rcm4_res = [n3',Rcm4_res];

T3_smb=Rcm4_res(find(Rcm4_res(:,1)==3),5:6); sig3_smb=[T3_smb(:,1)+0.2*T3_smb(:,1), T3_smb(:,1)-0.2*T3_smb(:,1)];
T3_ice=Rcm4_res(find(Rcm4_res(:,1)==4),5:6); sig3_ice=[T3_ice(:,1)+T3_ice(:,2), T3_ice(:,1)-T3_ice(:,2)];

cd('O:\Documents\RATES\R Code\img\FINAL_ST_review_RL02v15_EEMD')
F= xlsread('Results_EEMD_basin9.xls');
F=F(2:823,2:5);
n = 1:73; n2 = repmat(n,1,11);
b=zeros(19,1);c1=[n2'; b];
F = [c1,F]; 
clear n2 b c1 

%T2_smb=R_new(find(R_new(:,1)==4),5:6); sig2_ice=[T2_smb(:,1)+T2_smb(:,2), T2_smb(:,1)-T2_smb(:,2)];
%T2_ice=R_new(find(R_new(:,1)==5),5:6); sig2_ice=[T2_ice(:,1)+T2_ice(:,2), T2_ice(:,1)-T2_ice(:,2)];

T1_smb=F(find(F(:,1)==4),4:5); sig1_smb=[T1_smb(:,1)+T1_smb(:,2), T1_smb(:,1)-T1_smb(:,2)];
T1_ice=F(find(F(:,1)==5),4:5); sig1_ice=[T1_ice(:,1)+T1_ice(:,2), T1_ice(:,1)-T1_ice(:,2)];

cd('O:\Documents\RATES\R Code\matlab')

figure
subplot(1,2,1)
plotshaded(2003:2013,sig1_smb,'cy');
hold on
%plotshaded(2003:2013,EAIS3,'cy');
h1=plot(2003:2013,T1_smb(:,1),'b','LineWidth',2);
plotshaded(2003:2013,sig1_ice,'m');
hold on
%plotshaded(2003:2013,EAIS3,'cy');
h1=plot(2003:2013,T1_ice(:,1),'r','LineWidth',2);
axis([2003 2013 -200 200])

subplot(1,2,2)
h2=plot(2003:2013,T2_smb(:,1),'b','LineWidth',2);
hold on
plotshaded(2003:2013,sig2_ice,'m');
h1=plot(2003:2013,T2_ice(:,1),'r','LineWidth',2);
axis([2003 2013 -200 200])

%%%%%%%%%%%% Different format

figure
subplot(1,2,1)
plotshaded(2003:2013,sig1_smb,'k');
hold on
h1=plot(2003:2013,T1_smb(:,1),'k','LineWidth',2);
plotshaded(2003:2013,sig2_smb,'b');
h2=plot(2003:2013,T2_smb(:,1),'--b','LineWidth',2);
plotshaded(2003:2013,sig3_smb,'cy');
h3=plot(2003:2013,T3_smb(:,1),'--b','LineWidth',2);

axis([2003 2013 -250 250])

hXLabel = xlabel('Year');
hYLabel = ylabel('SMB anomalies (Gt/yr)');
%legend([h1,h2],'E1','E2a')
%legend([h1,h2,h3],'E1','E2a','E2b')
%set(gcf, 'PaperPositionMode', 'auto');
set(gca,'ygrid','on')
%set(gca,'LineWidth',0.05)

subplot(1,2,2)
plotshaded(2003:2013,sig1_ice,'k');
hold on
h3=plot(2003:2013,T1_ice(:,1),'k','LineWidth',2);
plotshaded(2003:2013,sig2_ice,'b');
h4=plot(2003:2013,T2_ice(:,1),'--b','LineWidth',2);
plotshaded(2003:2013,sig3_ice,'cy');
h5=plot(2003:2013,T3_ice(:,1),'--b','LineWidth',2);

axis([2003 2013 -50 150])

%hXLabel = xlabel('Year');
hYLabel = ylabel('Ice dynamics anomalies (Gt/yr)');
%%legend([h3,h4],'E1','E2a')
%legend([h3,h4,h5],'E1','E2a','E2b')

set(gcf, 'PaperPositionMode', 'auto');
set(gca,'ygrid','on','ytick',[-50:25:150])
set(gca,'LineWidth',0.05)
%set(gca,'GridLineStyle','-')
%%%%%%%%%%%% Different format

figure
subplot(1,2,1)
plotshaded(2003:2013,sig1_smb,'k');
hold on
h1=plot(2003:2013,T1_smb(:,1),'k','LineWidth',2);
plotshaded(2003:2013,sig2_smb,'k');
h2=plot(2003:2013,T2_smb(:,1),'--k','LineWidth',2);
plotshaded(2003:2013,sig3_smb,'k');
h3=plot(2003:2013,T3_smb(:,1),'-.k','LineWidth',2);

axis([2003 2013 -250 250])

hXLabel = xlabel('Year');
hYLabel = ylabel('SMB anomalies (Gt/yr)');
%legend([h1,h2,h3],'T1 SMB','T2 SMB','T3 SMB')
set(gcf, 'PaperPositionMode', 'auto');
%grid on 
set(gca,'ygrid','on')

subplot(1,2,2)
plotshaded(2003:2013,sig1_ice,'k');
hold on
h3=plot(2003:2013,T1_ice(:,1),'k','LineWidth',2);
plotshaded(2003:2013,sig2_ice,'k');
h4=plot(2003:2013,T2_ice(:,1),'--k','LineWidth',2);
plotshaded(2003:2013,sig3_ice,'k');
h5=plot(2003:2013,T3_ice(:,1),'-.k','LineWidth',2);

axis([2003 2013 -50 150])

hXLabel = xlabel('Year');
hYLabel = ylabel('Ice dynamics anomalies (Gt/yr)');
%legend([h3,h4,h5],'T1 ICE','T2 ICE','T3 ICE')
set(gcf, 'PaperPositionMode', 'auto');
set(gca,'ygrid','on','ytick',[-50:25:150])
  
