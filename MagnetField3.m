
clear;

% Espacio de la simulación

Lx = 2;                         %Longitud en X
Ly = 2;                         %Longitud en y

Nx = 15;                       %Divisiones en X
Ny = 15;                       %Divisiones en Y

Xi = -Lx/2;                     %Valor inicial en X
Xf = Lx/2;                      %Valor final en X
Yi = -Ly/2;                     %Valor inicial en Y
Yf = Ly/2;                      %Valor inicial en Y

x = Xi:Lx/(Nx-1):Xf;            %x axis
y = Yi:Lx/(Ny-1):Yf;            %y axis

[X,Y]=meshgrid(x,y);            %Simulation space


% Ubicación de monopolos

x1 = 0.2;
y1 = 0.0;
pol1 = +1;

x2 = -0.2;
y2 = 0.2;
pol2 = -1;


%Cálculo del campo magnético
for i=1:Nx        
    for j=1:Ny
      
        d1 = sqrt((x(i)-x1)^2+(y(j)-y1)^2);
        d2 = sqrt((x(i)-x2)^2+(y(j)-y2)^2);
        
        Ex1 = pol1*1/d1*(x(i)-x1);
        Ey1 = pol1*1/d1*(y(j)-y1);
        
        Ex2 = pol2*1/d2*(x(i)-x2);
        Ey2 = pol2*1/d2*(y(j)-y2);
        
        Ex(i,j) = Ex1 + Ex2;
        Ey(i,j) = Ey1 + Ey2;
            
    end    
end


%mesh(X,Y,R)
%contour(X,Y,R,100)
quiver(X,Y,Ey,Ex)

%startx = x-x;
%starty = y;
%streamline(X,Y,Ey,Ex,startx,starty)

hold on
plot(y1,x1,'*r')
plot(y2,x2,'*m')
hold off

axis([-1 1 -1 1])
grid

