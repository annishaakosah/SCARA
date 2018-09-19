
x0 = 350;
y0 = 55;

length = 100;

%Top Left Corner
xT = x0;
yT = y0;
%Top Right Corner
xR = x0 + length;
yR = y0 + 1;
%Bottom Right Corner
xB = x0 + length + 1;
yB = y0 + length - 1;
%Bottom Left Corner
xL = x0 - 1;
yL = y0 + length;

%TLC to TRC
xTop = round (xArray(xT, xR, 100));
yTop = round (yArray(yT, yR, 100));
% TRC to BRC
xRight = round (xArray(xR, xB, 100));
yRight = round (yArray(yR, yB, 100));
%BRC to BLC
xBottom = round (xArray(xB, xL, 100));
yBottom = round (yArray(yB, yL, 100));
%BLC to TLC
xLeft = round (xArray(xL, xT, 100));
yLeft = round (yArray(yL, yT, 100));

%Converts point to angle and then to voltages
[topM1, topM2] = invk(xTop, yTop);
[RightM1, RightM2] = invk(xRight , yRight);
[BottomM1, BottomM2] = invk(xBottom , yBottom);
[LeftM1, LeftM2] = invk(xLeft , yLeft);

%Runs the motors
[motor1] = horzcat (topM1, RightM1, LeftM1, BottomM1);
[motor2] = horzcat (topM2, RightM2, LeftM2, BottomM2);

pen = 1500*ones(size(motor1));
pen(1,1) = 1300;
pen(1,202) = 1300;
pen(1,203) = 1300;
pen(1,204) = 1300;
pen(1,205) = 1300;
pen(1,404) = 1300;

dlmwrite('drawSquare.txt', [round(motor1'), round(motor2'), pen'])



