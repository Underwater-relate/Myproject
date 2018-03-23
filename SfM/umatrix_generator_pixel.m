function [U,ray1_vector,ray2_vector]=umatrix_generator_pixel(img1,img2)

%---------------------------------------
	load n_cp.matrix

    p1=0;
    p2=0;
    
	count=0;
	for i=1:n_cp
		uv1=img1(i,:);
		uv2=img2(i,:);
%		u = u_generator(uv,uv1,n1,n2,n3,a,b,focal,rho1,rho2,cx,cy);
    if(uv1(1)<0 || uv1(2)< 0 ||uv2(1)<0||uv2(2)<0)
       continue;
     end
		[r1_in,r1, d1]=ray_in_out_pixel(uv1);
		[r2_in,r2, d2]=ray_in_out_pixel(uv2);
     count++;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		%img_calc1(i,:) = [u1,v1];
		%img_calc2(i,:) = [u2,v2];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
		
		

		%start=[d_norm1 d_norm2];

		%startpoint(i,:)=start;
        d1_mat(count,:)=d1;
        d2_mat(count,:)=d2;
		ray1_vector(count,:)=r1;
		ray2_vector(count,:)=r2;
		ray1_in_vector(count,:)=r1_in;
		ray2_in_vector(count,:)=r2_in;
        
%         if nomal*r1'>0.99
%             number1=i
%             nomal*r1'
%             p1=p1+1;
%         end
%         
%         if nomal*r2'>0.99
%             number2=i
%             nomal*r2'
%             p2=p2+1;
%         end
%         
%         save p.mat p1 p2
		
%		u=[r1(1)*r2(1) r1(2)*r2(1) r1(3)*r2(1) r1(1)*r2(2) r1(2)*r2(2) r1(3)*r2(2) r1(1)*r2(3) r1(2)*r2(3) r1(3)*r2(3) d1*r1(2)*r2(1)+d2*r1(1)*r2(2) -d1*r1(1)*r2(1)+d2*r1(2)*r2(2) d2*r1(3)*r2(2) d1*r1(2)*r2(2)-d2*r1(1)*r2(1) -d1*r1(1)*r2(2)-d2*r1(2)*r2(1) -d2*r1(3)*r2(1) d1*r1(2)*r2(3) -d1*r1(1)*r2(3)];

%		u=[r1(1)*r2(1) r1(2)*r2(1) r1(3)*r2(1) r1(1)*r2(2) r1(2)*r2(2) r1(3)*r2(2) r1(1)*r2(3) r1(2)*r2(3) r1(3)*r2(3) d1(3)*r1(2)*r2(1)-d1(2)*r1(3)*r2(1)+d2(3)*r1(1)*r2(2)-d2(2)*r1(1)*r2(3) d1(1)*r1(3)*r2(1)-d1(3)*r1(1)*r2(1)+d2(3)*r1(2)*r2(2)-d2(2)*r1(2)*r2(3) d1(2)*r1(1)*r2(1)-d1(1)*r1(2)*r2(1)+d2(3)*r1(3)*r2(2)-d2(2)*r1(3)*r2(3) d1(3)*r1(2)*r2(2)-d1(2)*r1(3)*r2(2)+d2(1)*r1(1)*r2(3)-d2(3)*r1(1)*r2(1) d1(1)*r1(3)*r2(2)-d1(3)*r1(1)*r2(2)+d2(1)*r1(2)*r2(3)-d2(3)*r1(2)*r2(1) d1(2)*r1(1)*r2(2)-d1(1)*r1(2)*r2(2)+d2(1)*r1(3)*r2(3)-d2(3)*r1(3)*r2(1) d1(3)*r1(2)*r2(3)-d1(2)*r1(3)*r2(3)+d2(2)*r1(1)*r2(1)-d2(1)*r1(1)*r2(2) d1(1)*r1(3)*r2(3)-d1(3)*r1(1)*r2(3)+d2(2)*r1(2)*r2(1)-d2(1)*r1(2)*r2(2) d1(2)*r1(1)*r2(3)-d1(1)*r1(2)*r2(3)+d2(2)*r1(3)*r2(1)-d2(1)*r1(3)*r2(2)];
	   u=[r1(1)*r2(1) r1(2)*r2(1) r1(3)*r2(1) r1(1)*r2(2) r1(2)*r2(2) r1(3)*r2(2) r1(1)*r2(3) r1(2)*r2(3) r1(3)*r2(3)...
           d1(3)*r1(2)*r2(1)-d1(2)*r1(3)*r2(1)+d2(3)*r1(1)*r2(2)-d2(2)*r1(1)*r2(3)...
           d1(1)*r1(3)*r2(1)-d1(3)*r1(1)*r2(1)+d2(3)*r1(2)*r2(2)-d2(2)*r1(2)*r2(3)...
           d1(2)*r1(1)*r2(1)-d1(1)*r1(2)*r2(1)+d2(3)*r1(3)*r2(2)-d2(2)*r1(3)*r2(3)...
           d1(3)*r1(2)*r2(2)-d1(2)*r1(3)*r2(2)+d2(1)*r1(1)*r2(3)-d2(3)*r1(1)*r2(1)...
           d1(1)*r1(3)*r2(2)-d1(3)*r1(1)*r2(2)+d2(1)*r1(2)*r2(3)-d2(3)*r1(2)*r2(1)...
           d1(2)*r1(1)*r2(2)-d1(1)*r1(2)*r2(2)+d2(1)*r1(3)*r2(3)-d2(3)*r1(3)*r2(1)...
           d1(3)*r1(2)*r2(3)-d1(2)*r1(3)*r2(3)+d2(2)*r1(1)*r2(1)-d2(1)*r1(1)*r2(2)...
           d1(1)*r1(3)*r2(3)-d1(3)*r1(1)*r2(3)+d2(2)*r1(2)*r2(1)-d2(1)*r1(2)*r2(2)...
           d1(2)*r1(1)*r2(3)-d1(1)*r1(2)*r2(3)+d2(2)*r1(3)*r2(1)-d2(1)*r1(3)*r2(2)];

		U(count,:)=u;

    end

 	%save startpoint.mat startpoint;
 	save ray_vectors.mat ray1_in_vector ray2_in_vector ray1_vector ray2_vector;
	save U.mat U;
  save d_vector.mat d1_mat d2_mat

end