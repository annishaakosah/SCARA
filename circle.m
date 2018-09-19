xcenter = 350; 
ycenter = 100;

radius = 50;
n = 180;

angle = 0:(2*pi)/n:2*pi;

x = xcenter + radius.*sin(angle);
y = ycenter + radius.*cos(angle);

penup = 1500;

[motor1, motor2] = invk(x,y);

pen = 1500*ones(size(motor1));
pen(1,1) = 1300;
pen(1,181) = 1300;

dlmwrite('drawCircle.txt', [round(motor1'), round(motor2'), pen'])