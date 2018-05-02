function [ J,darkChannel, A, T ] = HazeRemoval( I, patchSizeC, patchSizeR, omega, t0 )
%HazeRemoval Removes Haze from image I using dark channel prior
%   patchSizeC, patchSizeR are dimensions of local patch. omega is areal
%   perspective constant parameter. t0 is lower bound to transmission.

darkChannel = DarkChannel(I,patchSizeC,patchSizeR);
figure('Name','Dark Channel of Input Image','NumberTitle','off');
imshow(darkChannel);

[A] = AirLight(I,darkChannel);
T = Transmission(I,A,omega,patchSizeC,patchSizeR);
L = laplacian(double(I)/255);
lambda = 0.0001;
A = L + lambda * speye(size(L));
b = lambda * T(:);
size(A)
size(b)
x = A\b;
[m,n,~]=size(I);
T = reshape(x,m,n);
J = RecoverImage(I,A,T,t0);
end