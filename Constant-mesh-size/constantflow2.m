%numerical

l = 0.001;
n = 501;

u = zeros(n,1);
u(1) = 20;

di = 1;
d = di;

dx = di/(n-1);

r = 0.45;
t = 0;

q=[];

dx = dx;

tic;
while t < 10^6
    dt = dx^2*r;
    t = t + dt
    u_new = u;
    for i = 2:n-1
        u_new(i) = (1-2*r)*u(i) + (u(i-1)+u(i+1))*(r);
    end
    u_new(1) = u_new(2) + dx*(1+l);
    temp = d(end) + (r)*((u(n-1))/l);
    
    d = [d, temp];
    if d(end)/dx > (n)
        disp('hi');
        n = n + 1;
        u_new = spli(u_new,1);
    end
    dx_new = d(end)/(n-1);
    dx = d(end)/(n-1);
    u = u_new;
end
toc;
hold on;
plot(linspace(0,d(end)/2.5,n),u_new);


%analytical
t = 1.402;

n = @(x) exp(-(x./2000).^2) + pi^0.5 .* (x./2000) .* erf((x./2000));
d = exp(-t^2) + pi^0.5*t*erf(t);

f = @(x) 2000.*(1+l).*(t*n(x)/d - (x./2000));

fplot(f,[0,t*2000]);
hold off;
