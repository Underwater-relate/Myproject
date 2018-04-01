function dL=L(c,x,y,z,n1,n2,n3,R, r,d)
%  L = n2*sqrt((x-c1)*(x-c1)+(y-c2)*(y-c2)+(z-sqrt(r*r-c2*c2)*(z-sqrt(r*r-c2*c2))))...
%      +n1*sqrt(c1*c1 + c2*c2 + (d - sqrt(r*r -c2*c2)*(d - sqrt(r*r -c2*c2))));
	%dL(1)=-n2*(c(2)-c(1))/sqrt((rho2-rho1)^2+(c(2)-c(1))^2)+n1*c(1)/sqrt(rho1^2+c(1)^2);
	
%	dL(2)=-n3*(z-c(2))/sqrt((x-rho2)^2+(z-c(2))^2)+n2*(c(2)-c(1))/sqrt((rho2-rho1)^2+(c(2)-c(1))^2);		5/22
	%dL(2)=-n3*(x-c(2))/sqrt((z-rho2)^2+(x-c(2))^2)+n2*(c(2)-c(1))/sqrt((rho2-rho1)^2+(c(2)-c(1))^2);
    x0 = c(1);
    y0 = c(2);
    z0 = sqrt(R*R - y0*y0);
    x1 = c(3);
    y1 = c(4);
    z1 = sqrt(r*r - y1*y1);
    r_out = [x-x0 y-y0 z-z0];
    r_out = r_out/norm(r_out);
    r_mid = [x0-x1 y0-y1 z0-z1];
    r_mid = r_mid/norm(r_mid);
    r_in = [x1 y1 z1-d];
    r_in = r_in/norm(r_in);
    n_out_mid = [0 y0 z0];
    n_out_mid = n_out_mid/norm(n_out_mid);
    n_mid_in = [0 y1 z1];
    n_mid_in = n_mid_in/(norm(n_mid_in));
    sin_out = norm(cross(r_out, n_out_mid));
    sin_mid_o = norm(cross(r_mid, n_out_mid));
    sin_in = norm(cross(r_in, n_mid_in));
    sin_mid_in = norm(cross(r_mid, n_mid_in));
    dL(1)= n3*sin_out-n2*sin_mid_o;
    dL(2) = cross(r_out,r_mid)*n_out_mid';
    dL(3) = n2*sin_mid_in-n1*sin_in;
    dL(4) = cross(r_mid, r_in)*n_mid_in';
%     dL(1) = (n2*(2*x0 - 2*x1))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2))...
%         - (n3*(2*x - 2*x0))/(2*((x - x0)^2 + (y - y0)^2 + (z - (R^2 - y0^2)^(1/2))^2)^(1/2));
%     dL(2) = (n3*(2*y0 - 2*y + (2*y0*(z - (R^2 - y0^2)^(1/2)))/(R^2 - y0^2)^(1/2)))/(2*((x - x0)^2 + (y - y0)^2 + (z - (R^2 - y0^2)^(1/2))^2)^(1/2)) - (n2*(2*y1 - 2*y0 + (2*y0*((R^2 - y0^2)^(1/2)...
%         - (r^2 - y1^2)^(1/2)))/(R^2 - y0^2)^(1/2)))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2));
%     dL(3) = (n1*x1)/(2*y1 + ((r^2 - y1^2)^(1/2) - d)^2 + x1^2)^(1/2) - (n2*(2*x0 - 2*x1))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2));
%     dL(4) = (n2*(2*y1 - 2*y0 + (2*y1*((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2)))/(r^2 - y1^2)^(1/2)))/(2*((x0 - x1)^2 + (y0 - y1)^2 ...
%         + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2)) - (n1*((2*y1*((r^2 - y1^2)^(1/2) - d))/(r^2 - y1^2)^(1/2) - 2))/(2*(2*y1 + ((r^2 - y1^2)^(1/2) - d)^2 + x1^2)^(1/2));
    
 

end
