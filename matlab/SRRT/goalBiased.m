function randPoint = goalBiased(goal, xMax, yMax, goalPro)
%goal Ŀ���
%xMax yMax ��ͼ�߽�
if rand(1) < goalPro
    randPoint = goal;
else
    randPoint = rand(1,2).*[yMax xMax];
end
end