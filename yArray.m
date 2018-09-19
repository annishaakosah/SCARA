%Gets the y coordinates of the pixel between two points.
function yArrayValue = yArray (y1 , y2, n)
y = (y2-y1)/n
yArrayValue = y1 : y : y2
end