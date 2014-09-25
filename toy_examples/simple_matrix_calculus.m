% Koshlan Mayer-Blackwell
% September 25, 2014
% A simple example of matrix calculus in Matlab from in class example

% Suppose You Have A Matrix of Symbolic Values
syms a11
syms a12
syms a21
syms a22
Aind = [a11,a12;a21,a22]
% Represent that matrix as a vector 
Aind_vec = [a11,a12,a21,a22]
% Define a Function of the Matrix
%f = (3/2) * A(1,1) + (5*(A(1,2)^2)) + A(2,1) * A(2,2)
f = (3/2)*a11 + 5*(a12)^2 + a21 + a22
g = gradient(f, Aind_vec) 

% FINAL MATRIX REQUIRES RESHAPING THE VECTOR
reshape(g,2,2)'

%[ 3/2, 10*conj(a12)]
%[   1,            1]
