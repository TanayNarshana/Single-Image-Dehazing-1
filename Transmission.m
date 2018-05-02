function [T] = Transmission(I,A,omega,patchSizeC,patchSizeR)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
J = double(I);
[m,n,t] = size(I);

p = floor(patchSizeR/2);
q = floor(patchSizeC/2);

for k = 1:t
%     for i = 1:m
%         for j = 1:n
%             x = I(max(1,i-p):min(m,i+p),max(1,j-q):min(n,j+q),k);
%             J(i,j,k) = min(min(x))/A(k);
%         end
%     end
      J(:,:,k) = J(:,:,k)/double(A(k));
end

p = floor(patchSizeR/2);
q = floor(patchSizeC/2);

T = zeros(m,n);
for i = 1:m
    for j = 1:n
%         y = 266;
%         for k = 1:t
%             if J(i,j,k)<y
%                 y = J(i,j,k);
%             end
%         end
        T(i,j) = max(1 - (omega*(min(min(min(J(max(1,i-p):min(m,i+p),max(1,j-q):min(n,j+q),:)))))),0);
    end
end
end

