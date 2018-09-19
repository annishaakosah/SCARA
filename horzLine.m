%start and finish points of the line
x0 = 100; 
y0= 100; 
x1 = 350; 
y1= 500; 

%number of points our line is made from
N = 50; 

%x increment
dx = (x0-x1)/N; 

%y increment
dy = (y0-y1)/N;  

x = x1:dx:x0;
y = y1:dy:y0;

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

for i = 1: s
    if v1 < 1100 | v1 > 
        out(i,:) = [];
    
    
    elseif v2 > 1800
        out(i,:) = [];
    
    
    elseif abs(v1 - v2) > 450 
       out(i,:) = [];
    
    end

end
         
       


dlmwrite('horzLine.txt', out);