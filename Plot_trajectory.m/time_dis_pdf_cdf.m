clc;clear;
%%TIME

% tim1 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_1MROCK\time.txt');
% tim2 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_30CMCUBOID_GLPATH\133P_GLPATH_1MROCK\time.txt');
% tim3 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_40CMCUBOID_GLPATH\133P_GLPATH_1MROCK\time.txt');
% tim4 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CMCUBOID_GLPATH\133P_GLPATH_1MROCK\time.txt');
% figure(1)
% hh1=plot(kde(tim1'*12495.6/3600,'rot'),'b-'); hold on;%fprintf('.');
% set(hh1,'color','b','Linewidth',1.5);
% hh2=plot(kde(tim2'*12495.6/3600,'rot'),'g-'); hold on;
% set(hh2,'color','g','Linewidth',1.5);
% hh3=plot(kde(tim3'*12495.6/3600,'rot'),'r-'); hold on;
% set(hh3,'color','r','Linewidth',1.5);
% hh4=plot(kde(tim4'*12495.6/3600,'rot'),'m-'); hold on;
% set(hh4,'color','m','Linewidth',1.5);
% grid on;
% % pd = makedist('Normal');
% % y = pdf(pd,time);
% % plot(time,y,'LineWidth',2)
% axis on;
% axis([0.1 0.6 -inf 9]) 
% xlabel('setting time (h)','FontSize',16,'Fontname','Times New Roman')
% ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% 
% figure(2)
% h1=cdfplot(tim1'*12495.6/3600);hold on;
% set(h1,'color','b','Linewidth',1.5);
% h2=cdfplot(tim2'*12495.6/3600);hold on;
% set(h2,'color','g','Linewidth',1.5);
% h3=cdfplot(tim3'*12495.6/3600);hold on;
% set(h3,'color','r','Linewidth',1.5);
% h4=cdfplot(tim4'*12495.6/3600);hold on;
% set(h4,'color','m','Linewidth',1.5);
% axis([0.1 0.6 -inf 1]) 
% xlabel('setting time (h)','FontSize',16,'Fontname','Times New Roman')
% ylabel('CDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% title('')
% 
%%  DIS
% vel1 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_28CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis1.txt');
% vel2 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_30CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis1.txt');
% vel3 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_29CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis1.txt');
% vel4 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis1.txt');
% vel5 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_60CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis1.txt');
% vel6 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_36CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\total_dis1.txt');
% figure(1)
% hh1=plot(kde(vel1'*1.8969*1000,'rot'),'b-'); hold on;%fprintf('.');
% set(hh1,'color','b','Linewidth',1.5);
% hh2=plot(kde(vel2'*1.8969*1000,'rot'),'g-'); hold on;
% set(hh2,'color','g','Linewidth',1.5);
% hh3=plot(kde(vel3'*1.8969*1000,'rot'),'r-'); hold on;
% set(hh3,'color','r','Linewidth',1.5);
% hh4=plot(kde(vel4'*1.8969*1000,'rot'),'m-'); hold on;
% set(hh4,'color','m','Linewidth',1.5);
% hh5=plot(kde(vel5'*1.8969*1000,'rot'),'Y-'); hold on;
% set(hh5,'color','Y','Linewidth',1.5);
% hh6=plot(kde(vel6'*1.8969*1000,'rot'),'K-'); hold on;
% set(hh6,'color','K','Linewidth',1.5);
% grid on;
% % pd = makedist('Normal');
% % y = pdf(pd,time);
% % plot(time,y,'LineWidth',2)
% axis on;
% % axis([0.1 0.6 -inf 9]) 
% xlabel('transfer distance (m)','FontSize',16,'Fontname','Times New Roman')
% ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% 
% figure(2)
% h1=cdfplot(vel1'*1.8969*1000);hold on;
% set(h1,'color','b','Linewidth',1.5);
% h2=cdfplot(vel2'*1.8969*1000);hold on;
% set(h2,'color','g','Linewidth',1.5);
% h3=cdfplot(vel3'*1.8969*1000);hold on;
% set(h3,'color','r','Linewidth',1.5);
% h4=cdfplot(vel4'*1.8969*1000);hold on;
% set(h4,'color','m','Linewidth',1.5);
% % axis([0.1 0.6 -inf 1]) 
% xlabel('transfer distance (m)','FontSize',16,'Fontname','Times New Roman')
% ylabel('CDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% title('')

%%vel
% num1 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel2.txt');
% num2 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_30CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel2.txt');
% num3 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_40CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel2.txt');
% num4 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\vel2.txt');
% figure(1)
% hh1=plot(kde(num1'*1.8969*1000/12495.6,'rot'),'b-'); hold on;%fprintf('.');
% set(hh1,'color','b','Linewidth',1.5);
% hh2=plot(kde(num2'*1.8969*1000/12495.6,'rot'),'g-'); hold on;
% set(hh2,'color','g','Linewidth',1.5);
% hh3=plot(kde(num3'*1.8969*1000/12495.6,'rot'),'r-'); hold on;
% set(hh3,'color','r','Linewidth',1.5);
% hh4=plot(kde(num4'*1.8969*1000/12495.6,'rot'),'m-'); hold on;
% set(hh4,'color','m','Linewidth',1.5);
% grid on;
% % pd = makedist('Normal');
% % y = pdf(pd,time);
% % plot(time,y,'LineWidth',2)
% axis on;
% % axis([0.1 0.6 -inf 9]) 
% xlabel('landing velocity (m/s)','FontSize',16,'Fontname','Times New Roman')
% ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% 
% figure(2)
% h1=cdfplot(num1'*1.8969*1000/12495.6);hold on;
% set(h1,'color','b','Linewidth',1.5);
% h2=cdfplot(num2'*1.8969*1000/12495.6);hold on;
% set(h2,'color','g','Linewidth',1.5);
% h3=cdfplot(num3'*1.8969*1000/12495.6);hold on;
% set(h3,'color','r','Linewidth',1.5);
% h4=cdfplot(num4'*1.8969*1000/12495.6);hold on;
% set(h4,'color','m','Linewidth',1.5);
% % axis([0.1 0.6 -inf 1]) 
% xlabel('landing velocity (m/s)','FontSize',16,'Fontname','Times New Roman')
% ylabel('CDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% title('')

%%NUMBER
% num1 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\col_number.txt');
% num2 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_30CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\col_number.txt');
% num3 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_40CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\col_number.txt');
% num4 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\col_number.txt');
% figure(1)
% hh1=plot(kde(num1,'rot'),'b-'); hold on;%fprintf('.');
% set(hh1,'color','b','Linewidth',1.5);
% hh2=plot(kde(num2,'rot'),'g-'); hold on;
% set(hh2,'color','g','Linewidth',1.5);
% hh3=plot(kde(num3,'rot'),'r-'); hold on;
% set(hh3,'color','r','Linewidth',1.5);
% hh4=plot(kde(num4,'rot'),'m-'); hold on;
% set(hh4,'color','m','Linewidth',1.5);
% grid on;
% % pd = makedist('Normal');
% % y = pdf(pd,time);
% % plot(time,y,'LineWidth',2)
% axis on;
% % axis([0.1 0.6 -inf 9]) 
% xlabel('collision number (m/s)','FontSize',16,'Fontname','Times New Roman')
% ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% 
% figure(2)
% h1=cdfplot(num1);hold on;
% set(h1,'color','b','Linewidth',1.5);
% h2=cdfplot(num2);hold on;
% set(h2,'color','g','Linewidth',1.5);
% h3=cdfplot(num3);hold on;
% set(h3,'color','r','Linewidth',1.5);
% h4=cdfplot(num4);hold on;
% set(h4,'color','m','Linewidth',1.5);
% % axis([0.1 0.6 -inf 1]) 
% xlabel('collision number (m/s)','FontSize',16,'Fontname','Times New Roman')
% ylabel('CDF (-)','FontSize',16,'Fontname','Times New Roman')
% % title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
% set(gca,'FontSize',14,'Fontname','Times New Roman')
% legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
% legend('boxoff')
% title('')

%%
%OMG
OMG1 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_20CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW1.txt');
OMG2 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_30CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW1.txt');
OMG3 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_40CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW1.txt');
OMG4 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CM_XINCHENGXU\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG5 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_30CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG6 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_31CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG7 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_35CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG8 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_36CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG9 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_40CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG10 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_41CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG11= load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_45CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG12= load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_50CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
% OMG13 = load('E:\asteroid terrain\terrain\133P_CUBOID_GLPATH\133P_60CMCUBOID_GLPATH\133P_GLPATH_SMOOTH\WWW1.txt');
figure(1)
hh1=plot(kde(OMG1'/12495.6,'rot'),'b-'); hold on;%fprintf('.');
set(hh1,'color','b','Linewidth',1.5);
hh2=plot(kde(OMG2'/12495.6,'rot'),'g-'); hold on;
set(hh2,'color','g','Linewidth',1.5);
hh3=plot(kde(OMG3'/12495.6,'rot'),'r-'); hold on;
set(hh3,'color','r','Linewidth',1.5);
hh4=plot(kde(OMG4'/12495.6,'rot'),'m-'); hold on;
set(hh4,'color','m','Linewidth',1.5);
% hh5=plot(kde(OMG5'/12495.6,'rot'),'m-'); hold on;
% set(hh5,'color','K','Linewidth',1.5);
% hh6=plot(kde(OMG6'/12495.6,'rot'),'r-'); hold on;
% set(hh6,'color','y','Linewidth',1.5);
% hh7=plot(kde(OMG7'/12495.6,'rot'),'m-'); hold on;
% set(hh7,'color','c','Linewidth',1.5);
% hh8=plot(kde(OMG8'/12495.6,'rot'),'m-'); hold on;
% set(hh8,'color','K','Linewidth',1.5);
% hh9=plot(kde(OMG9'/12495.6,'rot'),'m-'); hold on;
% set(hh9,'color','c','Linewidth',1.5);
% hh10=plot(kde(OMG10'/12495.6,'rot'),'m-'); hold on;
% set(hh10,'color','K','Linewidth',1.5);
% hh11=plot(kde(OMG11'/12495.6,'rot'),'m-'); hold on;
% set(hh11,'color','K','Linewidth',1.5);
% hh12=plot(kde(OMG12'/12495.6,'rot'),'m-'); hold on;
% set(hh12,'color','c','Linewidth',1.5);
% hh13=plot(kde(OMG13'/12495.6,'rot'),'m-'); hold on;
% set(hh13,'color','K','Linewidth',1.5);
grid on;
% pd = makedist('Normal');
% y = pdf(pd,time);
% plot(time,y,'LineWidth',2)
axis on;
% axis([0.1 0.6 -inf 9]) 
xlabel('angular velocity (rad/s)','FontSize',16,'Fontname','Times New Roman')
ylabel('PDF (-)','FontSize',16,'Fontname','Times New Roman')
% title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
set(gca,'FontSize',14,'Fontname','Times New Roman')
legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm');
% legend('edge 20cm','edge 25cm','edge 28cm','edge 29cm','edge 30cm','edge 31cm','edge 35cm','edge 36cm','edge 40cm','edge 41cm','edge 45cm','edge 50cm','edge 60cm')
legend('boxoff')

figure(2)
h1=cdfplot(OMG1);hold on;
set(h1,'color','b','Linewidth',1.5);
h2=cdfplot(OMG2);hold on;
set(h2,'color','g','Linewidth',1.5);
h3=cdfplot(OMG3);hold on;
set(h3,'color','r','Linewidth',1.5);
h4=cdfplot(OMG4);hold on;
set(h4,'color','m','Linewidth',1.5);
% axis([0.1 0.6 -inf 1]) 
xlabel('collision number (m/s)','FontSize',16,'Fontname','Times New Roman')
ylabel('CDF (-)','FontSize',16,'Fontname','Times New Roman')
% title('one thousand 1 m rocks (500)','FontSize',18,'Fontname','Times New Roman')
set(gca,'FontSize',14,'Fontname','Times New Roman')
legend('edge 20cm','edge 30cm','edge 40cm','edge 50cm')
legend('boxoff')
title('')