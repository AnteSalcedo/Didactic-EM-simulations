
clear

v = 1;

CREF = -0.3;

Lam = 5; 
fx = 1/Lam;

T = 2;
ft = 1/T;
dt = T/100;

dx = 0.2
x =-10:dx:0;

t = 0;

figure(1)
grid
hold on

for i = 1:100*T

    oi = cos(2*pi*ft*t-2*pi*fx*x);
    or = CREF*cos(2*pi*ft*t+2*pi*fx*x + 1.8726);
    ot = oi+or;
    %plot(x,oi, 'c')
    
    %hold on
    %plot(x,or, 'm')
    stem(x,ot, 'b')
    axis([-10 0 -2 2])
    %plot(x,ot, 'b')
    %hold off
    
    F(:,i) = getframe;
    
    t = t+dt;

end

movie(F,1000)
