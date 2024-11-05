% eqn for cross-section of stream surface
x1 = [0:0.05:1]*pi;
y1 = [-1:0.05:1]*pi;
[m1,n1] = size(x1);
[m2,n2] = size(y1);
K = 1.3;
c = 0.0;
delta = pi/28;
z1=0;
x=ones(n2,n1);
y=ones(n2,n1);
for i = 1:n1
for j = 1:n2
z1(j,i) = sqrt(((x1(i)^2*(tan(delta))^2)+c)/(1/cos((atan(y1(j)/K))))^2)*sin(x1(i))*sin((y1(j)+pi)/2);
end
x(:,i)=x1(i)/pi;
y(:,i)=y1/pi*0.5;
end
figure(1)
surf(x(1,:),y(:,1),z1)
title('ORGINAL BUMP')
xlabel('x (length)')
ylabel('y (width)')
zlabel('z (height)')
axis equal