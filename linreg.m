## Copyright (C) 2021 YASH SINGH JHA
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} linreg (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: YASH SINGH JHA <YASH SINGH JHA@YASH-SEL70SV>
## Created: 2021-07-11

function theta = linreg (filename,number_of_data_points)
  m = number_of_data_points;
  % Reading data off a .txt file
  data = dlmread(filename);
  data_x = data(1:m,1);
  data_y = data(1:m,2);
  
  % We want to allow a non-zero intercept for our linear equation. So we add a column of all ones to our x column.
  n = length(data_x);
  %Add a column of all ones to data_x;
  data_X = [ones(n,1) data_x];
  % We use the normal equation to calculate theta.
  % Calculate theta = [intercept , slope]
  theta = (inverse(data_X'*data_X))*data_X'*data_y; 
  
  % Plot the fitted equation we got from the regression
  figure(m)
  plot(data_X(:,2), data_X*theta,'-')
  str = sprintf('Linear regression using Normal Equation:%d Data Points',m);
  title(str)
  hold on; % this keeps our previous plot of the data visible
  plotdata(data_x,data_y)
  xlabel('X') % Set the x-label
  ylabel('Y')% Set the y-label  
  legend( 'Linear regression','Scatter Plot')
  hold off % Don't put any more plots on this figure
endfunction
