clc;clear
pmax1_25cm=[];pmax2_25cm=[];begin1 = [];begin2=[];end1=[];end2=[];
for i=1:1000
    fid1=fopen(['D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_25CM\out',num2str(i),'.txt'],'r');
%     fid1=fopen(['D:\133P_CUBOID_GLPATH\133P_10CM_XIN\133P_GLPATH_SMOOTH\out',num2str(i),'.txt'],'r');
    %     fid1=fopen('D:\CUBOID30CMrock-133P-Hertz-RK4-SURFMOTO\force_40CM1.txt','r');
   [D,Count] = fscanf(fid1,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[19,inf]);
   D = D'; [m,n] = size(D);
  for j=2:m
    if(D(j-1,19)==0&&D(j,19)~=0)
      begin1 = [begin1,j];
      break;
    end
  end

  for k=j:m
    if(D(k-1,19)~=0&&D(k,19)==0)
        end1 = [end1,k];
      break;
    end
  end

  for s=k:m
    if(D(s-1,19)==0&&D(s,19)~=0)
        begin2 = [begin2,s];
      break;
    end
  end

  for q=s:m
    if(D(q-1,19)~=0&&D(q,19)==0)
        end2 = [end2,q];
      break;
    end
  end
  
  pmax1_25cm = [pmax1_25cm,max(D(j:k,3))];
  pmax2_25cm = [pmax2_25cm,max(D(s:q,3))];
  stal = fclose(fid1);
 
end
save D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_25CM\pmax1_25cm.mat pmax1_25cm
save D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_25CM\pmax2_25cm.mat pmax2_25cm


load('D:\133P_CUBOID_GLPATH\C_BASE_20CM\C25CM_20M\pmax1_25cm.mat');
C_pmax1_25cm = pmax1_25cm;
load('D:\133P_CUBOID_GLPATH\C_BASE_20CM\C30CM_20M\pmax1_30cm.mat');
C_pmax1_30cm = pmax1_30cm;
load('D:\133P_CUBOID_GLPATH\C_BASE_20CM\C35CM_20M\pmax1_35cm.mat');
C_pmax1_35cm = pmax1_35cm;

load('D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_25CM\pmax1_25cm.mat');
load('D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_30CM\pmax1_30cm.mat');
load('D:\133P_CUBOID_GLPATH\CYLINDER_BASE_20CM\CYLINDER_35CM\pmax1_35cm.mat');


   hh1=plot(kde(pmax1_25cm,'rot'),'m-'); hold on;
   set(hh1,'color','m','Linewidth',1.5);
    hh2=plot(kde(pmax1_30cm,'rot'),'m-'); hold on;
   set(hh2,'color','r','Linewidth',1.5);
    hh3=plot(kde(pmax1_35cm,'rot'),'m-'); hold on;
   set(hh3,'color','b','Linewidth',1.5);
    hh4=plot(kde(C_pmax1_25cm,'rot'),'m-'); hold on;
   set(hh4,'color','g','Linewidth',1.5);
   hh5=plot(kde(C_pmax1_30cm,'rot'),'m-'); hold on;
   set(hh5,'color','k','Linewidth',1.5);
     hh6=plot(kde(C_pmax1_35cm,'rot'),'m-'); hold on;
   set(hh6,'color','C','Linewidth',1.5);
   
   xlabel('max penetration (-)','FontSize',16,'Fontname','Times New Roman')
ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
title('TD1最大侵入深度','FontSize',16);%,'Fontname','Times New Roman')
set(gca,'FontSize',14);%,'Fontname','Times New Roman')
legend('圆柱15cm','圆柱22cm','圆柱29cm','长方体25cm','长方体30cm','长方体35cm');