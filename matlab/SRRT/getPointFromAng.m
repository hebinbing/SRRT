function point = getPointFromAng(A, theta, stepSize)
%��֪һ����ͼнǼ�����һ����
A = [A(2) A(1)];
%��λ����
u = [cos(theta) sin(theta)];
point = A + stepSize .* u;
point = [point(2) point(1)];
end