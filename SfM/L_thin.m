function dL=L_thin(c,x,y,z,n1,n3,R,d)

    x0 = c(1);
    y0 = c(2);
    z0 = sqrt(R*R - y0*y0)-d;
    r_out = [x-x0 y-y0 z-z0];
    r_out = r_out/norm(r_out);
    r_in = [x0 y0 z0];
    r_in = r_in/norm(r_in);
    n_out_in = [0 y0 z0];
    n_out_in = n_out_in/(norm(n_out_in));
    sin_out = norm(cross(r_out, n_out_in));
    sin_in = norm(cross(r_in, n_out_in));
    
    dL(1)= n3*sin_out-n1*sin_in;
    dL(2) = cross(r_out,r_in)*n_out_in';
%     dL(1) = (n2*(2*x0 - 2*x1))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2))...
%         - (n3*(2*x - 2*x0))/(2*((x - x0)^2 + (y - y0)^2 + (z - (R^2 - y0^2)^(1/2))^2)^(1/2));
%     dL(2) = (n3*(2*y0 - 2*y + (2*y0*(z - (R^2 - y0^2)^(1/2)))/(R^2 - y0^2)^(1/2)))/(2*((x - x0)^2 + (y - y0)^2 + (z - (R^2 - y0^2)^(1/2))^2)^(1/2)) - (n2*(2*y1 - 2*y0 + (2*y0*((R^2 - y0^2)^(1/2)...
%         - (r^2 - y1^2)^(1/2)))/(R^2 - y0^2)^(1/2)))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2));
%     dL(3) = (n1*x1)/(2*y1 + ((r^2 - y1^2)^(1/2) - d)^2 + x1^2)^(1/2) - (n2*(2*x0 - 2*x1))/(2*((x0 - x1)^2 + (y0 - y1)^2 + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2));
%     dL(4) = (n2*(2*y1 - 2*y0 + (2*y1*((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2)))/(r^2 - y1^2)^(1/2)))/(2*((x0 - x1)^2 + (y0 - y1)^2 ...
%         + ((R^2 - y0^2)^(1/2) - (r^2 - y1^2)^(1/2))^2)^(1/2)) - (n1*((2*y1*((r^2 - y1^2)^(1/2) - d))/(r^2 - y1^2)^(1/2) - 2))/(2*(2*y1 + ((r^2 - y1^2)^(1/2) - d)^2 + x1^2)^(1/2));
    
 

end
