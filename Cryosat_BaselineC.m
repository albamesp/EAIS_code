%%% Plot CS2 data over FRIS, looking at different orbits
cd ('O:\Documents\RATES\R Code\data\AIS_Data\Coastline')
poly = shaperead('moa_groundingline');
xant=poly.X; yant=poly.Y;zant=1+zeros(1,length(xant));
 
cd ('C:\Users\am14341\Local Documents\cs2_groundinglines\cs2_FRIS')

%%This is baseline B including all data 2011-2014
load FRIS_cs2.mat
n=length(FRIS(:,1));
%Let's do annual plots
days= FRIS(:,1); 
%First day of 2011 is
d0=FRIS(1,1 );

CS2_11 = FRIS(find(FRIS(:,1)<(d0+365)),:); n1=length(CS2_11(:,1))
CS2_12 = FRIS(find( d0+365 <= FRIS(:,1)& FRIS(:,1) <(d0+2*365) ),:); n2=length(CS2_12(:,1))
CS2_13 = FRIS(find((d0+2*365) <= FRIS(:,1) & FRIS(:,1)<(d0+3*365) ),:);n3=length(CS2_13(:,1))
CS2_14 = FRIS(find(FRIS(:,1)>=(d0+3*365) ),:);n4=length(CS2_14(:,1))

CS2_11_sub = FRIS(find(CS2_11(:,4)<4*10^5 & CS2_11(:,5)<-0.7*10^6 & CS2_11(:,5)>-1.1*10^6 ),:);
CS2_12_sub = FRIS(find(CS2_12(:,4)<4*10^5 & CS2_12(:,5)<-0.7*10^6 & CS2_12(:,5)>-1.1*10^6 ),:);
CS2_13_sub = FRIS(find(CS2_13(:,4)<4*10^5 & CS2_13(:,5)<-0.7*10^6 & CS2_13(:,5)>-1.1*10^6 ),:);
CS2_14_sub = FRIS(find(CS2_14(:,4)<4*10^5 & CS2_14(:,5)<-0.7*10^6 & CS2_14(:,5)>-1.1*10^6 ),:);

figure
h1=gcf
%scatter( CS2_11(1:100:n1,5),CS2_11(1:100:n1,4),5,CS2_11(1:100:n1,6),'fill')
scatter( CS2_11_sub(:,5),CS2_11_sub(:,4),5,CS2_11_sub(:,6),'fill')
colorbar
caxis([50 200])
hold on
plot(xant,yant,'k-')
axis([-1.6*10^6 -0.4*10^6  1*10^5 11*10^5])
saveas(gcf,'FRIS_2011data.png','png'); 

figure
h1=gcf
scatter( CS2_12(1:100:n1,5),CS2_12(1:100:n1,4),5,CS2_12(1:100:n1,6),'fill')
colorbar
caxis([50 200])
hold on
plot(xant,yant,'k-')
axis([-1.6*10^6 -0.4*10^6  1*10^5 11*10^5])
saveas(gcf,'FRIS_2012data.png','png'); 

figure
h1=gcf
scatter( CS2_13(1:100:n1,5),CS2_13(1:100:n1,4),5,CS2_13(1:100:n1,6),'fill')
colorbar
caxis([50 200])
hold on
plot(xant,yant,'k-')
axis([-1.6*10^6 -0.4*10^6  1*10^5 11*10^5])
saveas(gcf,'FRIS_2013data.png','png'); 

figure
h1=gcf
scatter( CS2_14(1:100:n1,5),CS2_14(1:100:n1,4),5,CS2_14(1:100:n1,6),'fill')
colorbar
caxis([50 200])
hold on
plot(xant,yant,'k-')
axis([-1.6*10^6 -0.4*10^6  1*10^5 11*10^5])
saveas(gcf,'FRIS_2014data.png','png'); 

%Check days span
hist(FRIS(:,1))
%Check seconds span in a random day %1day = 86400 sec
d=find(FRIS(:,1)==5400); 
hist(FRIS(d,2))

%these are too large for plotting, lets start with a smallest region



%%%This is baseline C
cd('\\ads.bris.ac.uk\filestore\MyFiles\Staff16\am14341\Documents\CS_LTA__SIR_SINI2__20120101T023705_20120101T023916_C001_OUT_ANT.DBL')
data = importdata('CS_LTA__SIR_SINI2__20120115T004124_20120115T004253_C001_OUT_ANT_FRIS.dbl');
cd ('O:\Documents\RATES\R Code\matlab\polarstereo_fwd')
[x2,y2]=polarstereo_fwd(data(:,4).*10^-7,data(:,5).*10^-7,6378137.0,axes2ecc(6378137.0, 6356752.3),-71,0);
figure, plot(x2,y2,'+b')
hold on
plot(xant,yant,'r-')
