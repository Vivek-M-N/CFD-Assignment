
function [B]= SPLIN(A,b)
Ao1=[1:length(A)];
Ai1=linspace(1,length(A),length(A)+b);
B=interp1(Ao1,A,Ai1);
end




