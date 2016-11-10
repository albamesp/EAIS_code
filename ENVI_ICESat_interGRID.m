% Interpolated node gets a 1
I = zeros(length(data2),1);
I(nodes_eval)=1;
grid_2009=[x2,y2,I];

%%%
%%I consider inteporlated if more than 50% comes from interpolated for an
%%specific period

%2003-2009 --> more than 4
I = zeros(length(data2),1);
for i=1:length(x2)
   if  (grid_2003(i,3)+ grid_2004(i,3)+ grid_2005(i,3)+ grid_2006(i,3)+ grid_2007(i,3)+ grid_2008(i,3)+ grid_2009(i,3))>3
       I(i)=1;
   end
end
grid_0309 = [x2,y2,I];

%2003-2006 --> more than 2
I = zeros(length(data2),1);
for i=1:length(x2)
   if  (grid_2003(i,3)+ grid_2004(i,3)+ grid_2005(i,3))+ grid_2006(i,3)>2
       I(i)=1;
   end
end
grid_0306 = [x2,y2,I];

%2007-2009 --> more than 2
I = zeros(length(data2),1);
for i=1:length(x2)
   if  (grid_2007(i,3)+ grid_2008(i,3)+ grid_2009(i,3))>2
       I(i)=1;
   end
end
grid_0709 = [x2,y2,I];

figure
plot(grid_0306(:,1),grid_0306(:,2),'r.')
hold on
plot(grid_0306(find(grid_0306(:,3)==1),1),grid_0306(find(grid_0306(:,3)==1),2),'b.')
axis equal
colormap(flipud(jet));
caxis([-1.5 1.5])
colorbar
title('Interpolated nodes 0306')
figure
plot(grid_0709(:,1),grid_0709(:,2),'r.')
hold on
plot(grid_0709(find(grid_0709(:,3)==1),1),grid_0709(find(grid_0709(:,3)==1),2),'b.')
axis equal
colormap(flipud(jet));
caxis([-1.5 1.5])
colorbar
title('Interpolated nodes 0709')

figure
plot(grid_0309(:,1),grid_0309(:,2),'r.')
hold on
plot(grid_0309(find(grid_0309(:,3)==1),1),grid_0309(find(grid_0309(:,3)==1),2),'b.')
axis equal
colormap(flipud(jet));
caxis([-1.5 1.5])
colorbar
title('Interpolated nodes 0309')
