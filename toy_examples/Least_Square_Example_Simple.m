%% LEAST SQUARES
% Koshlan Mayer-Blackwell
% SUPOSE YOU HAVE SOME DATA x,y

a = [2,3.5,4]
b = [2,4,6]
z = ones(1,3) % Add this to accomodate intercept

% MAKE YOUR DESIGN MATRIX
A = [a;z]'
b = b'

%% LEAST SQUARE. MATRIX ALGREBA SEE DICUSSIONS OF PROJECTIONS BY GILBERT STRAND,
% Basically we are trying to find parameters x1,x2,... that minimize the
% difference between Ax and b. This minimium distance is the orthogonal
% projection of b onto the column space of A.

% x stands for parameters
% Ax = b
% (A'A)x = A'b
% x = inv(A'A)A'b

x = inv(A'*A)*(A')*b

% PLOT Points
hold off
scatter(a,b);
ylim([-2,10])
xlim([0,10])

% PLOT A BEST FIT LINE TO SEE HOW WE DID
x = [0:9]
y = ones(1,10)
X = [x;y]'
predict = X*P
hold on 
plot(x, predict)

% NOTES FOR FUTURE
% DO THIS WITH MULTIPLE VARIABLES, DO THIS WITH X2^2, and calculate error
% bars.








