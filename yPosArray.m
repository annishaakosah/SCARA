function dyArray = yPosArray(yA, yB, n)
    dy = (yB - yA)/n;
    dyArray = yA : dy : yB;