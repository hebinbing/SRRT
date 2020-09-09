function puredPath = extraneousNode(path, angle, d, map)
%P3Ϊ��ǰ����Ҫ��Ҫȥ���ĵ�
%path��ǰ������ͺ��������������
n = size(path,1) - 2;
%��ʼ��
puredPath = path(1:2,:);

for i = 3 : n
    m = size(puredPath,1); 
    P0 = puredPath(m-1,:);
    P1 = puredPath(m,:);
    P2 = path(i,:);
    P3 = path(i+1,:);
    P4 = path(i+2,:);
    
    if ~checkAngle(P0,P1,P3,angle) || ~checkAngle(P1,P3,P4,angle)
        %p2���Ƕ���ĵ�
        puredPath = [puredPath; P2];
        continue;
    end
    [~,~,curLine1]=checkCurLine(P0,P1,P3,map,d);
    [~,~,curLine2]=checkCurLine(P1,P3,P4,map,d);
    u = (P2-P1)/norm(P2-P1,2); 
    s1 = P1 + d * u;
    s2 = P3 - d * u;
    [~,~,line] = checkLine(s1, s2, map);
    if ~curLine1 || ~curLine2 || ~line
        puredPath = [puredPath; P2];
        continue;
    end
end

puredPath = [puredPath;path(end-1:end,:)];
end