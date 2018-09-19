%start and finish points of the line
x0 = 300; 
y0= 200; 
x1 = 301; 
y1= 100; 

%number of points our line is made from
N = 50; 

%x increment
dx = (x1-x0)/N; 

%y increment
dy = (y1-y0)/N;  

x = x0:dx:x1;
y = y0:dy:y1;

[t1,t2] = invk(x, y);
v1 = t1;
v2 = t2;
s = size(v1);
time = 1:s(2);
figure()

figure()

%display result
plot(time,v1,'r', time, v2, 'b')

%pen down all the time
pen = 1500*ones(1,s(2)); 

%move to start point with pen up

%p(1) = 1400; 

%pen up before last point
%p(length(p))=1400;

out = zeros(s(2),3);
out(:,1) = round(v1);
out(:,2) = round(v2);
out(:,3) = pen;
%out = [v1 v2 v3]; %transpose 3 vectors and make matrix of them


dlmwrite('vertLine.txt', out);