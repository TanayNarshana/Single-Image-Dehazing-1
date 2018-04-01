function [ A ] = AirLight( I, J )
%AirLight Finds the AirLight colour for image I with dark channel J
%   Detailed explanation goes here
[m,n] = size(J);
searchPixels = floor(0.001*m*n);
newline;
Jarray = reshape(J,m*n,1);
Iarray = reshape(I,m*n,3);
[~,Indices] = sort(Jarray,'descend');
val = 0;
INDEX = 0;
for i=1:searchPixels
    t = norm(double(Iarray(Indices(i),:)));
    if(t > val)
        val = t;
        INDEX = Indices(i);
    end
end
A = Iarray(INDEX,:);
end

