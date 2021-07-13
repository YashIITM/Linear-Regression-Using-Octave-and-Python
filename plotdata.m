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
## @deftypefn {} {@var{retval} =} plotdata (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: YASH SINGH JHA <YASH SINGH JHA@YASH-SEL70SV>
## Created: 2021-07-10

function plotdata (x,y)
  % Plot the data:
  plot(x,y,'rx','MarkerSize',2);
endfunction
