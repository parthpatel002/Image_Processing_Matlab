clc;
clear all;
close all;
img = imread('img_assgn2.png');
img = img * 255;
% figure, imshow(img)
% [HT,theta,rho] = hough(img);
[HT,theta,rho] = hough(img,'RhoResolution',2.51);
% [HT,theta,rho] = hough(img,'RhoResolution',1,'Theta',89);
% disp(size(theta))
% disp(size(rho))
figure
imshow(imadjust(rescale(HT)),[],...
       'XData',theta,...
       'YData',rho,...
       'InitialMagnification','fit');
xlabel('\theta (in degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
colormap(gca,hot)
P = houghpeaks(HT,4,'threshold',ceil(0.5*max(HT(:))));
% disp(size(P))
% Uncomment below line to see values of rho and theta for the 4 peaks
% disp(P)
x = theta(P(:,2));
y = rho(P(:,1));
% Peaks highlighted in Figure 2 in cyan color
plot(x,y,'o','color','cyan');
lines = houghlines(img,theta,rho,P,'FillGap',80,'MinLength',10);
% disp(length(lines))
figure, imshow(img), hold on
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',1,'Color','green');
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','red');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','yellow');
end
