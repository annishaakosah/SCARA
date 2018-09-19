x0 = 350; 
y0= 100;

x1 = 351; 
y1= 200; 

x2 = 450; 
y2= 200; 

x3 = 451; 
y3= 100;

part1 = vertcat(square(x0, y0, x1, y1), square(x1, y1, x2, y2));
part2 = vertcat(square(x2, y2, x3, y3), square(x3, y3, x0, y0));
out = vertcat(part1, part2);
dlmwrite('square.txt', out);