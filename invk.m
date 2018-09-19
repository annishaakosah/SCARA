function [voltage1,voltage2] = invk(xt, yt)

% motor positions
xm1 = 393;
ym1 = 446;
xm2 = 261;
ym2 = 447;

% arm length 
R = 240;

% pen position
%x = pos(1);
%y = pos(2);

xa1 = (xt+xm1)/2; % coordinates for midpoint between motor1 and pen 
ya1 = (yt+ym1)/2;

xa2 = (xt+xm2)/2; % coordinates for midpoint between motor2 and pen 
ya2 = (yt+ym2)/2;

% distance from midpoint to motor
%d1 = (0.5 * (sqrt((xt-xm1).^2 + (yt - ym1).^2)));
%d2 = (0.5 * (sqrt((xt-xm2).^2 + (yt - ym2).^2)));

% distance from midpoint to joint
%h1 = sqrt(R.^2 - d1.^2);
%h2 = sqrt(R.^2 -d2.^2);

d1=sqrt((xt-xm1).^2+(yt-ym1).^2);
d2=sqrt((xt-xm2).^2+(yt-ym2).^2);
h1=sqrt(R^2 - (d1/2).^2);
h2=sqrt(R^2 - (d2/2).^2);

alpha = 0.5 * pi - atan2(ym2 - yt, xm2 - xt);
beta = 0.5 * pi - atan2(ym1 - yt, xm1 - xt);

% joint 1 positions
xj1 = xa1 + h1.*cos(beta);
yj1 = ya1 - h1.*sin(beta);

% joint 2 positions
xj2 = xa2 - h2.*cos(alpha);
yj2 = ya2 + h2.*sin(alpha);

% joint 1 angles
angle1 = atan2(ym1-yj1, xm1 - xj1)*180/pi;

% joint 2 angles
angle2 = atan2(ym2-yj2, xm2 - xj2)*180/pi;

% angles to voltages
voltage1 = leftMotor(angle1);
voltage2 = rightMotor(angle2);



end