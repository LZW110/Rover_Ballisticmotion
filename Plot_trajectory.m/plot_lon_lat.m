%%在有效势分布图上绘制起点和终点

SP = [];
EP = [];

% load('e:\WTG\1M_100_20200113-2018-Bennu-Hertz-RK4-SURFMOTO\BZ.TXT');

for i = 1:1000
%     if(BZ(i,2)==0)
        fid1=fopen(['e:\WTG\20cm_2_1000_20200113-2018-Bennu-Hertz-RK4-SURFMOTO\GLPATH',num2str(i),'.txt'],'r');
        [D,Count] = fscanf(fid1,' %i %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[15,inf]);
        D = D'; [m,n] = size(D);
        if(sqrt(D(m,3).^2+D(m,4).^2+D(m,5).^2)<1.2)
%         start_point = D(1,2:4);
%         end_point = D(m,2:4);
          SP = [SP; D(1,3:5)];
          EP = [EP; D(m,3:5)];
        end 
        sta = fclose(fid1);
end

S_Lon1 = []; S_Lat1 = [];
E_Lon1 = []; E_Lat1 = [];

for i=1:size(SP,1)
    if(SP(i,2)>0)
        lon = acos(SP(i,1)/sqrt(SP(i,1)^2 + SP(i,2)^2));
    else
        lon = 2*pi-acos(SP(i,1)/sqrt(SP(i,1)^2 + SP(i,2)^2));
    end
    
%     if(lon>pi&&lon<=2*pi)
%         lon=lon-2*pi;
%     end
    
    lat = atan(SP(i,3)/sqrt(SP(i,1)^2 + SP(i,2)^2));
    
    lon = lon*180/pi;
    lat = lat*180/pi;
    
    S_Lon1 = [S_Lon1; lon];
    S_Lat1 = [S_Lat1; lat];
    
    %--------
     if(EP(i,2)>0)
        lon = acos(EP(i,1)/sqrt(EP(i,1)^2 + EP(i,2)^2));
    else
        lon = 2*pi-acos(EP(i,1)/sqrt(EP(i,1)^2 + EP(i,2)^2));
    end
    
%     if(lon>pi&&lon<=2*pi)
%         lon=lon-2*pi;
%     end
    
    lat = atan(EP(i,3)/sqrt(EP(i,1)^2 + EP(i,2)^2));
    
    lon = lon*180/pi;
    lat = lat*180/pi;
    
    E_Lon1 = [E_Lon1; lon];
    E_Lat1 = [E_Lat1; lat];
               
end

lon_lat = zeros(length(E_Lat1),2);
lon_lat(:,1)= E_Lon1;
lon_lat(:,2)= E_Lat1;
save e:\WTG\20cm_2_1000_20200113-2018-Bennu-Hertz-RK4-SURFMOTO\lon_lat.txt -ascii lon_lat
% open('有效势分布图.fig'); hold on;

h(2) = scatter(E_Lon1, E_Lat1,20, 'rx');
h(1) = scatter(S_Lon1, S_Lat1, 30, 'g.'); hold on;


% legend('\itr_0')

% legend([h(1), h(2)],'{\itr_{01}}','{\itr_{f1}}')

