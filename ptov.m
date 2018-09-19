function [vm1 vm2] = ptov(xt, yt)

xm1=263 % motor 1
ym1=463
xm2=411 % motor 2
ym2=463
R=250 % arm length

xa1 = (xt+xm1)/2 % coordinates for midpoint between motor1 and pen 
ya1 = (yt+ym1)/2

xa2 = (xt+xm2)/2 % coordinates for midpoint between motor2 and pen 
ya2 = (yt+ym2)/2

d1=sqrt((xt-xm1).^2+(yt-ym1).^2)
d2=sqrt((xt-xm2).^2+(yt-ym2).^2)
h1=sqrt(R^2 - (d1/2).^2)
h2=sqrt(R^2 - (d2/2).^2)

beta = pi/2 - atan2(ym1-yt,xm1-xt)
alpha = pi/2 - atan2(ym2-yt,xm2-xt)

xj1 = xa1 - h1.*cos(beta);
yj1 = ya1 + h1.*sin(beta);

xj2 = xa2 + h2.*cos(alpha);
yj2 = ya2 - h2.*sin(alpha);

amr1 = atan2 (ym1-yj1, xj1-xm1)
amr2 = atan2 (ym2-yj2, xj2-xm2)

am1 = amr1 *180/pi
am2 = amr2 *180/pi

vm1 = leftMotor (am1)
vm2 = rightMotor (am2)