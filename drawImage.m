
I = imread(uigetfile);
%converts image to gray scale images 
BW = rgb2gray(I)

%Finds the edges and draws them
BW1 = edge(BW,'Canny');

B = bwboundaries(BW1,'noholes')

%shows the image after being processed
imshow(BW1);
%sets the motors which will hold the volategs needed

[motorVolt1] = [];
[motorVolt2] = [];
%Pen voltages
[pen] = [];

%Keeps track of which letter or when the pen is needed to be lifted
%it is in which allows us to determine when to lift the pen
count = 0;

%This whole for loop goes through the array which contains the x and y
%coordinates of the edges of the image.
for i=1: length(B)
    z = B{i};
    for y=1:length(z)
        %either add or subtract from x and y coordinates to fit image
        %accordingly
        % Calls the invk function to convert the pixels into angle and then
        % angles to voltages. The + 250 adds 250 pixel to the original
        % coordinates to ensure that the image position is at a place where
        % the SCARA arm can reach (The -15 is for the  axis)
        [motor1, motor2] = invk(z(y,1) + 250, z(y,2) - 15);
        [motorVolt1] = horzcat (motorVolt1, motor1);
        [motorVolt2] = horzcat (motorVolt2, motor2);
        [pen] = horzcat (pen, 1500);
        count = count +1;
    end
    pen (1, count-length(z)+1) = 1300;
    pen (1, count-length(z)+2) = 1300;
    pen (1, count) = 1400;
end

pen (1,1) = 1300;
pen (1, size(motorVolt1)) = 1300;

dlmwrite('skynet.txt', [round(motorVolt1'), round(motorVolt2'), pen'])
    
        
        
