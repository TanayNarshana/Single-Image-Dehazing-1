function [ J ] = DarkChannel( I, patchSizeC, patchSizeR )
%DarkChannel generates the dark channel of image I
%   the patch has size = patchSizeR x patchSizeC

p = floor(patchSizeR/2);
q = floor(patchSizeC/2);
[m,n,t] = size(I);
J = zeros(m,n);
for i = 1:m
    for j = 1:n
        x = I(max(1,i-p):min(m,i+p),max(1,j-q):min(n,j+q),:);
        for k = 1:t
            x = min(x);
        end
        J(i,j) = x;
    end
end
J = J;
end

