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
## @deftypefn {} {@var{retval} =} inverse (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: YASH SINGH JHA <YASH SINGH JHA@YASH-SEL70SV>
## Created: 2021-07-12
clc
function b = inverse (A)
  %Finding dimensions of the matrix:
  [r,c] = size(A);
  n = r;
  b = eye(n);
  if r~=c
    disp('Only Square Matrices have inverse')
    b=[];
    exit()
  end
  a = [A eye(n)];
  %Apply Guass Jordan Elimination:
  for i = [1:n]
    if a(i,i) == 0.0
      printf("Not Invertible")
      exit()
    endif
    for j = [1:n]
      if i ~= j
        ratio = a(j,i)/a(i,i);
        for k = [1:2*n]
          a(j,k) = a(j,k) - ratio*a(i,k);
        endfor
      endif
    endfor
  endfor
  %Row operation to make principal diagonal element to 1:
  for i = [1:n]
    divisor = a(i,i);
    for j =[1:2*n]
      a(i,j) = a(i,j)/divisor;
    endfor
  endfor
  %Printing the inverted matrix:
  printf('INVERTED MATRIX IS:')
  for i = [1:n]
    for j =[n+1:2*n]
      b(i,j-n) = a(i,j);
    endfor
  endfor
endfunction
