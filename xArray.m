%Gets the x coordinates of the pixel between two points.
function xArrayValue = xArray (x1 , x2, n)
x = (x2-x1)/n
xArrayValue = x1 : x : x2
end