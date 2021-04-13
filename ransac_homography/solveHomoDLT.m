function h = solveHomoDLT(pts1,pts2)


n = size(pts1,2);
A = zeros(2*n,9);

% x1 200  y1 337  x2 171 y2 94
%    23      337     166    210
%    23      24      20     100
%    200     24      34     222

A(1:2:2*n,1:2) = -pts1';
A(1:2:2*n,3) = -1;
A(2:2:2*n,4:5) = -pts1';
A(2:2:2*n,6) = -1;
x1 = pts1(1,:)';
y1 = pts1(2,:)';
x2 = pts2(1,:)';
y2 = pts2(2,:)';
A(1:2:2*n,7) = x2.*x1;
A(2:2:2*n,7) = y2.*x1;
A(1:2:2*n,8) = x2.*y1;
A(2:2:2*n,8) = y2.*y1;
A(1:2:2*n,9) = x2;
A(2:2:2*n,9) = y2;
disp(A);

%% Homogeneous least squares : find 'h' minimizing ||Ah||^2
% Eigenvectors of A'*A corresponding to smallest eigenvalue
[~, ~, V] = svd(A);
h = V(:, end);
h = reshape(h,[3,3])';
% for easy computation, divide by end of h value
h = h/h(end);

end