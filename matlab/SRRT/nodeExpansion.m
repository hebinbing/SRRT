function pointC = nodeExpansion(pointA, pointB,stepSize)
%��AB�ĵ�λ����

unitVector = (pointB-pointA)/norm(pointB-pointA,2);

pointC = pointA + stepSize*unitVector;
end