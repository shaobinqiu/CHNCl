clear%
poscar=import_poscar('./files/POSCAR');
eigenvectors=load('./files/eigenvectors.txt');
err=[];
 for ii=1:size(eigenvectors,1)
     delta_p=zeros(size(eigenvectors,2)/3,3);
    for jj=1:size(eigenvectors,2)/3
        delta_p(jj,:)=eigenvectors(ii,jj*3-2:jj*3);
    end
    delta_p=delta_p/max(abs(eigenvectors(ii,:)))*0.05;%%%max of dx dy dz is 0.05A
    delta_p_D=delta_p/poscar.lattice;
    pos=poscar.coords+delta_p_D;
    %%%%check the distance between atoms
    D=neighbor(pos*poscar.lattice,4);
    for kk=1:size(D,1)
        D(kk,kk)=10000;
    end
    [C,I]=min(min(D));
    if  C<1%distance < 1A
        err=[err; ii,I];
    end 
    %%%%
     n=['POSCAR_CHNCl/POSCAR-',num2str(ii)];
     fid=fopen(n,'w+');
     fprintf(fid,'CHNCl \n');
     fprintf(fid,'%g\n',1);
     fprintf(fid,'%-4.6f     %-4.6f     %-4.6f\n',poscar.lattice');
     fprintf(fid,'C H N Cl\n');
     fprintf(fid,'%g     %g       %g      %g\n',poscar.atomcount');
     fprintf(fid,'Direct\n');
     for vv=1:size(pos,1)
         fprintf(fid,'%-4.6f     %-4.6f     %-4.6f      \n',pos(vv,:)');
     end
     fclose(fid);
 end