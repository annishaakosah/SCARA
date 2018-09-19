function dxArray = xPosArray(xA, xB, n)
    dx = (xB - xA)/n;
    dxArray = xA : dx : xB;