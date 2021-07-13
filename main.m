% Creates a plot of first m data points off the required data file :
% Note down the slope and intercept values:
clc
filename = "data1.txt"
  for m = [50 100 200]
    theta = linreg(filename,m);
    fprintf('%s : %i Data Points : Intercept = %f ; Slope = %f',filename,m,theta(1),theta(2));
  endfor
