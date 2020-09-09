function [xBestNear,row] = nodeSelection(RRTTree, xRand, angle)
%����ÿһ���ڵ���xRand֮��ľ���
nearTreeDis = [];
xBestNear = [];
row = 1;
for i=2:size(RRTTree,1)
    distance = norm(RRTTree(i,1:2) - xRand, 2);
    nearTreeDis =[nearTreeDis;RRTTree(i,:) distance];
end
%����
[nearTreeDis,A] = sortrows(nearTreeDis,4);
%�Ƕȼ��
for i = 1:size(nearTreeDis,1)
    nowNode = nearTreeDis(i,1:2);
    parentId = nearTreeDis(i,3);    
    parentNode = RRTTree(parentId,1:2);
    if checkAngle(parentNode, nowNode, xRand, angle)
        xBestNear = nearTreeDis(i,1:3);
        row = A(i) + 1;
        break;
    end
end
end