clc;clear;
da=1;
dis = [];vel = [];vel2 = [];vel3 = [];vel4 = [];vel5 = [];vel6 = [];
dvel = [];dvel1 = [];dvel2 = [];
dis1 = [];dis2 = [];dis3 = [];dis4 = [];
total_dis1 = [];total_dis2 = [];total_dis3 = [];total_dis4 = [];total_dis5 = [];
WWW1 = [];WWW2 = [];WWW3 = [];WWW4 = [];
for i = 1:1000
% if(i==8)
% else
% fid1=fopen(['E:\asteroid terrain\MENGTEKALUO\1M_c500\GLPATH',num2str(i),'.txt'],'r');
fid1=fopen(['E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CM_XINCHENGXU\133P_GLPATH_SMOOTH\GLPATH',num2str(i),'.txt'],'r');
[D,Count] = fscanf(fid1,'%f %i %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[16,inf]);
% [D,Count] = fscanf(fid1,'%i %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[15,inf]);
D = D'*da; [m,n] = size(D);
% if((sqrt(D(m,3).^2+D(m,4).^2+D(m,5).^2)<1.2))
if((sqrt(D(m,4).^2+D(m,5).^2+D(m,6).^2)<1.2))
    [lon,lat]=cal_lon_lat(D(m,4:6));
%       [lon,lat]=cal_lon_lat(D(m,3:5));
    D(:,1)=D(:,2);
    if(((lon>89)&&(lon<91))&&lat>2.5&&lat<5)  %133P
        for kk=2:m
            if((D(kk,1)==1&&D(kk-1,1)==0)||(D(kk,1)==0&&(kk==m)))
                CC = D(kk,4:6);
%                 CC = D(kk,3:5);
%                 WWW1 = [WWW1;norm(D(kk,9:11))];
                WWW1 = [WWW1;norm(D(kk,10:12))];
                vel = [vel;sqrt(D(kk,6).^2+D(kk,7).^2+D(kk,8).^2)];
                dvel = [dvel;abs(sqrt(D(kk-2,6).^2+D(kk-2,7).^2+D(kk-2,8).^2)-sqrt(D(kk-1,6).^2+D(kk-1,7).^2+D(kk-1,8).^2))];
            else
                if((D(kk,1)==2&&D(kk-1,1)==1)||(D(kk,1)==1&&kk==m))
                    CC1=D(kk,3:5);
                    WWW2 = [WWW2;norm(D(kk,10:12))];
                    total_dis1 = [total_dis1;norm(CC1-CC)];
                    dis1 = [dis1;norm(CC1-CC)];
                    vel2 = [vel2;sqrt(D(kk,6).^2+D(kk,7).^2+D(kk,8).^2)];
                    dvel1 = [dvel1;abs(sqrt(D(kk-2,6).^2+D(kk-2,7).^2+D(kk-2,8).^2)-sqrt(D(kk-1,6).^2+D(kk-1,7).^2+D(kk-1,8).^2))];
                else
                    if((D(kk,1)==3&&D(kk-1,1)==2)||(D(kk,1)==2&&kk==m))
                        CC2=D(kk,3:5);
                        WWW3 = [WWW3;norm(D(kk,10:12))];
                        total_dis2 = [total_dis2;norm(CC2-CC)];
                        dis2 = [dis2;norm(CC2-CC1)];
                        vel3 = [vel3;sqrt(D(kk,6).^2+D(kk,7).^2+D(kk,8).^2)];
                        dvel2 = [dvel2;abs(sqrt(D(kk-2,6).^2+D(kk-2,7).^2+D(kk-2,8).^2)-sqrt(D(kk-1,6).^2+D(kk-1,7).^2+D(kk-1,8).^2))];
                    else
                        if((D(kk,1)==4&&D(kk-1,1)==3)||(D(kk,1)==3&&kk==m))   
                            CC3=D(kk,3:5);
                            WWW4 = [WWW4;norm(D(kk,10:12))];
                            total_dis3 = [total_dis3;norm(CC3-CC)];
                            dis3 = [dis3;norm(CC3-CC2)];
                            vel4 = [vel4;sqrt(D(kk,6).^2+D(kk,7).^2+D(kk,8).^2)];
                        else
                            if((D(kk,1)==5&&D(kk-1,1)==4)||(D(kk,1)==4&&kk==m))
                                CC4=D(kk,3:5);
                                total_dis4 = [total_dis4;norm(CC4-CC)];
                                dis4 = [dis4;norm(CC4-CC3)];
                                vel5 = [vel5;sqrt(D(kk,6).^2+D(kk,7).^2+D(kk,8).^2)];
                            else
                                if((D(kk,1)==6&&D(kk-1,1)==5)||(D(kk,1)==5&&kk==m))
                                    CC5=D(kk,3:5);
                                    total_dis5 = [total_dis5;norm(CC5-CC)];
                                    vel6 = [vel6;sqrt(D(kk,6).^2+D(kk,7).^2+D(kk,8).^2)];
                                end
                            end
                        end
                    end
                end
            end
        end
        DD = D(m,3:5)-CC;
       dis = [dis;sqrt(DD(1).^2+DD(2).^2+DD(3).^2)];
    end
end 
%plot3(D(1,3),D(1,4),D(1,5),'g.','MarkerSize',20);  hold on; % grid on
%plot3(D(m,3),D(m,4),D(m,5),'r.','MarkerSize',20);  hold on; % grid on
%plot3(D(1:end,3),D(1:end,4),D(1:end,5),'k','LineWidth',0.5);  hold on; % grid on 
sta1 = fclose(fid1);
end
% end
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis5.txt' -ascii total_dis5
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dis1.txt' -ascii dis1
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dis2.txt' -ascii dis2
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dis3.txt' -ascii dis3
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dis4.txt' -ascii dis4
save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW1.txt' -ascii WWW1
save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW2.txt' -ascii WWW2
save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW3.txt' -ascii WWW3
save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW4.txt' -ascii WWW4
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis2.txt' -ascii total_dis2
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis3.txt' -ascii total_dis3
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis4.txt' -ascii total_dis4
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dis.txt' -ascii dis
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel.txt' -ascii vel
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel2.txt' -ascii vel2
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel3.txt' -ascii vel3
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel4.txt' -ascii vel4
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel5.txt' -ascii vel5
% % save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel6.txt' -ascii vel6
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dvel.txt' -ascii dvel
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dvel1.txt' -ascii dvel1
% save 'E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\dvel2.txt' -ascii dvel2