function dL=L(c,x,y,z,n1,n2,n3,R, r,d)
%  L = n2*sqrt((x-c1)*(x-c1)+(y-c2)*(y-c2)+(z-sqrt(r*r-c2*c2)*(z-sqrt(r*r-c2*c2))))...
%      +n1*sqrt(c1*c1 + c2*c2 + (d - sqrt(r*r -c2*c2)*(d - sqrt(r*r -c2*c2))));
	%dL(1)=-n2*(c(2)-c(1))/sqrt((rho2-rho1)^2+(c(2)-c(1))^2)+n1*c(1)/sqrt(rho1^2+c(1)^2);
	
%	dL(2)=-n3*(z-c(2))/sqrt((x-rho2)^2+(z-c(2))^2)+n2*(c(2)-c(1))/sqrt((rho2-rho1)^2+(c(2)-c(1))^2);		5/22
	%dL(2)=-n3*(x-c(2))/sqrt((z-rho2)^2+(x-c(2))^2)+n2*(c(2)-c(1))/sqrt((rho2-rho1)^2+(c(2)-c(1))^2);
    x0 = c(1);
    y0 = c(2);
    x1 = c(3);
    y1 = c(4);
    dL(1) = (n2*(2*x0 - 2*x1))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2))...
        - (n3*(2*x - 2*x0))/(2*((x - x0)^2 + (y - y0)^2 + (z - (R^2 - y0^2)^(1/2))^2)^(1/2));
    dL(2) = (n3*(2*y0 - 2*y + (2*y0*(z - (R^2 - y0^2)^(1/2)))/(R^2 - y0^2)^(1/2)))/(2*((x - x0)^2 + (y - y0)^2 + (z - (R^2 - y0^2)^(1/2))^2)^(1/2)) - (n2*(2*y1 - 2*y0 + (2*y0*((R^2 - y0^2)^(1/2)...
        - (r^2 - y1^2)^(1/2)))/(R^2 - y0^2)^(1/2)))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2));
    dL(3) = (n1*x1)/(2*y1 + ((r^2 - y1^2)^(1/2) - d)^2 + x1^2)^(1/2) - (n2*(2*x0 - 2*x1))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2));
    dL(4) = (n2*(2*y1 - 2*y0 + (2*y1*((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2)))/(r^2 - y1^2)^(1/2)))/(2*((x0 - x1)^2 + (y0 - y1)^2 ...
        + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2)) - (n1*((2*y1*((r^2 - y1^2)^(1/2) - d))/(r^2 - y1^2)^(1/2) - 2))/(2*(2*y1 + ((r^2 - y1^2)^(1/2) - d)^2 + x1^2)^(1/2));
 

end