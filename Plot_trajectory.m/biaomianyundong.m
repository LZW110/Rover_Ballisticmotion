clear all; clc

%------------------------------
% VS=load('VS_20cm.txt');
% VS = VS/0.244629552191E+000;
% FS=load('FS_20cm.txt');  hold on
VS=load('VS_133P_1MROCK.txt');
FS=load('FS_133P_1MROCK.txt');  hold on
% VS=load('VS.txt');
% FS=load('FS.txt');  hold on
%---------------------------------------

a1 = VS(:,1); a2 = VS(:,2); a3 = VS(:,3);
VS = [a1, a2, a3];
p=patch('Vertices', VS,'Faces',FS,'FaceVertexCData',[0.5,0.5,0.5],'FaceColor','flat','FaceAlpha',0.8);
set(p,'edgecolor','k');
% colormap(hot)
material dull;  camlight;   %material dull/metal/default/shiny
lighting gouraud; hold on; 
axis equal
view(3)

%%
% fid = fopen('ShapeModel_133P_58CM.obj','wt');
% [m,n] = size(VS);
% for i = 1:m
%     fprintf(fid,'%s\t','v');
%     for j = 1:n
%         if(j==n)
%             fprintf(fid,'%g\n',VS(i,j));
%         else
%             fprintf(fid,'%g\t',VS(i,j));
%         end
%     end
% end
% [m,n] = size(FS);
% for i = 1:m
%     fprintf(fid,'%s\t','f');
%     for j = 1:n
%         if(j==n)
%             fprintf(fid,'%g\n',FS(i,j));
%         else
%             fprintf(fid,'%g\t',FS(i,j));
%         end
%     end
% end
% fclose(fid);
% 
% % % % % % % axis tight; % view(2); % grid on;
% m=1;
% for i = 1:length(VS)
%     p = VS(i,:);
%     [lon,lat]=cal_lon_lat(p);
%     if((lon>179.5&&lon<180.5)&&lat>-0.6&&lat<0.6)   
% %       if((lon>0&&lon<5||lon>355&&lon<360)&&lat>86&&lat<90)    
%         VSX(m)=i;
%         m=m+1;
%       end          
% end
% FSX = determine_FS(VSX,FS);
% FSX=unique(FSX);
% plot_rock(FSX,VS,FS)


cal = [];index1 = [];index2 = [];
for i =1:1000
  fid1=fopen(['GLPATH',num2str(i),'.txt'],'r');
% fid1=fopen('GLPATH3.txt','r');
  [D,Count] = fscanf(fid1,' %i %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[15,inf]);
  D = D'; [m,n] = size(D);
%   if(sqrt(D(m,3).^2+D(m,4).^2+D(m,5).^2)<=1.2)
      cal = [cal;i];
      plot3(D(1,3),D(1,4),D(1,5),'g.','Markersize',8);  hold on; % grid on 
     plot3(D(:,3),D(:,4),D(:,5),'r');  hold on; % grid on 
     plot3(D(m,3),D(m,4),D(m,5),'b.','Markersize',8);  hold on; % grid on 
%       continue;
%   end 
 
  for ll = 2:m
    if((D(ll,1)==1)&&(D(ll-1,1)==0))
      index1 = [index1;D(ll,3:5)];
    else
      if((D(ll,1)==2)&&(D(ll-1,1)==1))
          index2 = [index2;D(ll,3:5)];
      end
    end
  end
  sta1 = fclose(fid1);
end
view(3)
axis equal;
camlight
lighting phong
save index1.txt -ascii index1;
save index2.txt -ascii index2;

% cal = [];
% for i = 1:1000
%   fid1=fopen(['GLPATH',num2str(i),'.txt'],'r');
% % fid1=fopen('GLPATH3.txt','r');
%   [D,Count] = fscanf(fid1,' %i %f %f %f %f %f %f %f %f %f %f %f %f %f %f',[15,inf]);
%   D = D'; [m,n] = size(D);
%   if(sqrt(D(m,3).^2+D(m,4).^2+D(m,5).^2)>1.2)
%       cal = [cal;i];
%       continue;
%   end
%   plot3(D(1,3),D(1,4),D(1,5),'g.','Markersize',8);  hold on; % grid on 
%   plot3(D(:,3),D(:,4),D(:,5),'r');  hold on; % grid on 
%   plot3(D(m,3),D(m,4),D(m,5),'b.','Markersize',8);  hold on; % grid on 
%   sta1 = fclose(fid1);
% end


view(3)
axis equal;
camlight
lighting phong
% 
% v1 = VS(FS(1,1),:);
% v2 = VS(FS(1,2),:);
% v3 = VS(FS(1,3),:);
% v = (v1+v2+v3);
% n = cross(v2-v1,v3-v2)*10;
% quiver3(v(1),v(2),v(3),n(1),n(2),n(3))

% theta = 60;
% rotationz = [cosd(theta) -sind(theta) 0; sind(theta) cosd(theta) 0; 0 0 1];
% v = [0.5634 0.2863 0.0006]';
% vr = rotationz*v*1
% r = [-1.1737 -0.5964 -0.0012];

BZ = zeros(1000,1);
for i=1:1000
    if(ismember(i,cal))
        BZ(i)=4;
    else
        BZ(i)=1;
    end
end
    