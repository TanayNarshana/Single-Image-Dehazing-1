function [J] = RecoverImage(I,A,T,t0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
J = I;
[m,n,t] = size(I);
for i =1:m
    for j = 1:n
        for k = 1:t
            J(i,j,k) = ((I(i,j,k)-A(k))/max(T(i,j),t0)) + A(k);
        end
    end
end
end

