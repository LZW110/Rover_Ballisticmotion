clc;clear
force1_35cm=[];force2_35cm=[];begin1 = [];begin2=[];end1=[];end2=[];
force_guodu = [];force_guodu1 = [];
for i=1:1000
    fid1=fopen(['D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_35CM\force',num2str(i),'.txt'],'r');
%     fid1=fopen(['D:\133P_CUBOID_GLPATH\133P_10CM_XIN\133P_GLPATH_SMOOTH\out',num2str(i),'.txt'],'r');
    %     fid1=fopen('D:\CUBOID30CMrock-133P-Hertz-RK4-SURFMOTO\force_40CM1.txt','r');
   [D,Count] = fscanf(fid1,'%f %f %f %f %f %f %f',[7,inf]);
   D = D'; [m,n] = size(D);
  for j=2:m
    if(D(j-1,1)==0&&D(j,1)~=0)
      begin1 = [begin1,j];
      break;
    end
  end

  for k=j:m
    if(D(k-1,1)~=0&&D(k,1)==0)
        end1 = [end1,k];
      break;
    end
  end

  for s=k:m
    if(D(s-1,1)==0&&D(s,1)~=0)
        begin2 = [begin2,s];
      break;
    end
  end

  for q=s:m
    if(D(q-1,1)~=0&&D(q,1)==0)
        end2 = [end2,q];
      break;
    end
  end
  
  for g=j:k
      force_guodu = [force_guodu,sqrt(D(g,1).^2+D(g,2).^2+D(g,3).^2)];
  end
  force1_35cm = [force1_35cm,max(force_guodu)];
  
  for g=s:q
      force_guodu1 = [force_guodu1,sqrt(D(g,1).^2+D(g,2).^2+D(g,3).^2)];
  end
  force2_35cm = [force2_35cm,max(force_guodu1)];
  stal = fclose(fid1);
 
end
save D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_35CM\force1_35cm.mat force1_35cm
save D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_35CM\force2_35cm.mat force2_35cm


load('D:\133P_CUBOID_GLPATH\C_BASE_20CM\C25CM_20M\force1_25cm.mat');
C_force1_25cm = force1_25cm;
load('D:\133P_CUBOID_GLPATH\C_BASE_20CM\C30CM_20M\force1_30cm.mat');
C_force1_30cm = force1_30cm;
load('D:\133P_CUBOID_GLPATH\C_BASE_20CM\C35CM_20M\force1_35cm.mat');
C_force1_35cm = force1_35cm;

load('D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_25CM\force1_25cm.mat');
load('D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_30CM\force1_30cm.mat');
load('D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_35CM\force1_35cm.mat');
% load('D:\133P_CUBOID_GLPATH\CUBOID\CUBOID20CM_20M\force1_20cm.mat');
% load('D:\133P_CUBOID_GLPATH\CUBOID50CM_20M\force2_50cm.mat');

   hh1=plot(kde(force1_25cm*1898.6/12495.6.^2,'rot'),'m-'); hold on;
   set(hh1,'color','m','Linewidth',1.5);
    hh2=plot(kde(force1_30cm*1898.6/12495.6.^2,'rot'),'m-'); hold on;
   set(hh2,'color','r','Linewidth',1.5);
    hh3=plot(kde(force1_35cm*1898.6/12495.6.^2,'rot'),'m-'); hold on;
   set(hh3,'color','b','Linewidth',1.5);
    hh4=plot(kde(C_force1_25cm*1898.6/12495.6.^2,'rot'),'m-'); hold on;
   set(hh4,'color','g','Linewidth',1.5);
   hh5=plot(kde(C_force1_30cm*1898.6/12495.6.^2,'rot'),'m-'); hold on;
   set(hh5,'color','k','Linewidth',1.5);
     hh6=plot(kde(C_force1_35cm*1898.6/12495.6.^2,'rot'),'m-'); hold on;
   set(hh6,'color','C','Linewidth',1.5);
   
   xlabel('max force (N)','FontSize',16,'Fontname','Times New Roman')
ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
title('TD1最大接触力','FontSize',16);%,'Fontname','Times New Roman')
set(gca,'FontSize',14);%,'Fontname','Times New Roman')
legend('圆柱15cm','圆柱22cm','圆柱29cm','长方体25cm','长方体30cm','长方体35cm');