dt = 0.01;
l = 0.004;
n = 101;

u = zeros(n,1);
u(1) = 20;

di = 0.1;
d = di;

dx = di/(n-1);

r = 0.1;
t = 0;

dt = 0.001

tic;
while t < 10^6
    dt = dx^2*r;
    t = t + dt
    u_new = u;
    for i = 2:n-1
        u_new(i) = (1-2*dt/dx^2)*u(i) + (u(i-1)+u(i+1))*(dt/dx^2);
    end
    u = u_new;
    temp = d(end) + (dt/dx^2)*((u(n-1))/l);
    
    d = [d, temp];
    dx = d(end)/(n-1);
end
toc;

hold on;
plot(linspace(0,d(end)/4,n),u_new);

f = @(x) 20*(exp(-(x./2000).^2) + pi^0.5.*(x./2000).*erf(x./2000) - pi^0.5.*(x./2000).*erf(1.402) - (x./2000)/(exp(1.402^2)*1.402));
fplot(f,[0,0.972*2000])
