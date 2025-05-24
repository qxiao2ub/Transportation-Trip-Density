% 122822-Fig A-trip demand OD heatmap all day-large font
% %{

% read dijt
for t=1:40 %40 time periods
    fileName=['Period',num2str(t-1),'.txt']; %txt: Period0 to 39
    read=load(fileName); %load that txt
    d(:,:,t)=read; %assign txt to dijt
    s(t,1)=sum(sum(read)); %sum OD pair per each t
end

% 122822-sum over t per OD pair
for i=1:i_up
  for j=1:j_up
      OD(i,j)=0;
        for t=1:40
          OD(i,j)=OD(i,j)+d(i,j,t);
        end
  end
end

% Fig B.1-plot heatmap t=5 dijt-flip jet color-123022
% %{
figure(2);
h1 = heatmap(d(:,:,5));
h1.FontSize = 23;
colorbar; %show color bar
% colormap(parula); %change colormap setting
colormap(flipud(jet)); %flip jet colormap-123022
xlabel('Zone j');
% xlabel('Zone j','FontSize', 23);
ylabel('Zone i');
% ylabel('Zone i','FontSize', 23);
title('t=5 trip demand dijt heatmap')
%}

% Fig B-plot heatmap t=5 dijt-jet color-123022
%{
figure(1);
h1 = heatmap(d(:,:,5));
h1.FontSize = 23;
colorbar; %show color bar
% colormap(parula); %change colormap setting
colormap(jet); %change cool colormap-123022
xlabel('Zone j');
% xlabel('Zone j','FontSize', 23);
ylabel('Zone i');
% ylabel('Zone i','FontSize', 23);
title('t=5 trip demand dijt heatmap')
%}

% Fig A-plot heatmap for OD through all day
%{
figure(1);
h1 = heatmap(OD);
h1.FontSize = 23;
colorbar; %show color bar
colormap(parula); %change colormap setting
xlabel('Zone j');
% xlabel('Zone j','FontSize', 23);
ylabel('Zone i');
% ylabel('Zone i','FontSize', 23);
title('All day demand per OD pair')
%}

