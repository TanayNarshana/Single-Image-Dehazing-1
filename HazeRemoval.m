function [ J,darkChannel, A, T ] = HazeRemoval( I, patchSizeC, patchSizeR, omega, t0 )
%HazeRemoval Removes Haze from image I using dark channel prior
%   patchSizeC, patchSizeR are dimensions of local patch. omega is areal
%   perspective constant parameter. t0 is lower bound to transmission.

darkChannel = DarkChannel(I,patchSizeC,patchSizeR);
figure('Name','Dark Channel of Input Image','NumberTitle','off');
imshow(darkChannel,[])

[A] = AirLight(I,darkChannel);
T = Transmission(I,A,omega,patchSizeC,patchSizeR);
J = RecoverImage(I,A,T,t0);
end

