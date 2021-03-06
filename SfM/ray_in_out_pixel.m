function [r_out, x_s] = ray_in_out_pixel(uv,d, cali)
load parameter.mat;
if cali==1
    n3 = n1;
end
u = uv(1) - hcx; % coord on image sensor
v = uv(2) - hcy;
r_in=[u, v*fx/fy, fx]; % ray in air
r_in = r_in/norm(r_in); % normalize
t_0 = (-r_in(3)*d + sqrt(r_in(3)*r_in(3)*d*d-(r_in(2)*r_in(2)+r_in(3)*r_in(3))*(d*d-r*r)))/(r_in(2)*r_in(2)+r_in(3)*r_in(3));
   if(d+r_in(3)*t_0 < 0)
      t_0 = (-r_in(3)*d - sqrt(r_in(3)*r_in(3)*d*d-(r_in(2)*r_in(2)+r_in(3)*r_in(3))*(d*d-r*r)))/(r_in(2)*r_in(2)+r_in(3)*r_in(3));
   end

p1 = [r_in(1)*t_0 r_in(2)*t_0 r_in(3)*t_0+d]; % point at glass and air
N = [0 p1(2) p1(3)]; % normal between air and glass
N_norm = N/norm(N);
s1 = norm(cross(r_in, N_norm)); % sin(theta_1)
c1 =norm( r_in.*N_norm); % cos(theta_1)
r_glass = n1*r_in/n2 - (n1*c1/n2-sqrt(1- n1*n1/(n2*n2)*s1*s1))*N_norm;
r_glass_norm = r_glass/norm(r_glass);
t_1 =( -(p1(2)*r_glass_norm(2) +p1(3)*r_glass_norm(3)) + sqrt((p1(2)*r_glass_norm(2) +p1(3)*r_glass_norm(3))*(p1(2)*r_glass_norm(2) +p1(3)*r_glass_norm(3))...
      -(r_glass_norm(2)*r_glass_norm(2)+r_glass_norm(3)*r_glass_norm(3))*(p1(2)*p1(2) + p1(3)*p1(3)-R*R)))/(r_glass_norm(2)*r_glass_norm(2)+r_glass_norm(3)*r_glass_norm(3));
if(p1(3)+ t_1*r_glass_norm(3)<0)
     t_1 =( -(p1(2)*r_glass_norm(2) +p1(3)*r_glass_norm(3)) - sqrt((p1(2)*r_glass_norm(2) +p1(3)*r_glass_norm(3))*(p1(2)*r_glass_norm(2) +p1(3)*r_glass_norm(3))...
      -(r_glass_norm(2)*r_glass_norm(2)+r_glass_norm(3)*r_glass_norm(3))*(p1(2)*p1(2) + p1(3)*p1(3)-R*R)))/(r_glass_norm(2)*r_glass_norm(2)+r_glass_norm(3)*r_glass_norm(3));
end
p2 = [p1(1)+t_1*r_glass_norm(1) p1(2)+t_1*r_glass_norm(2) p1(3)+t_1*r_glass_norm(3)]; % point at glass and water
N1 = [0 p2(2) p2(3)]; % normal between glass and water
N1_norm = N1/norm(N1);
s2 = norm(cross(r_glass_norm,N1_norm));
c2 = norm(r_glass_norm.*N1_norm);
r_out = n2/n3*r_glass_norm - (n2/n3*c2-sqrt(1- n2*n2/(n3*n3)*s2*s2))*N1_norm;
r_out = r_out/norm(r_out);
x_s = p2;
end