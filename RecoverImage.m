function [J] = RecoverImage(I,A,T,t0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
J = double(I);
[m,n,t] = size(I);
for i =1:m
    for j = 1:n
        for k = 1:t
            J(i,j,k) = ((double(I(i,j,k))-double(A(k)))/(T(i,j))) + double(A(k));
        end
    end
end
MIN = min(min(min(J)));
MAX = max(max(max(J)));
if(MIN<0 || MAX>255)
    J = ((J-MIN)/(MAX-MIN))*255;
end
J = uint8(J);
end

