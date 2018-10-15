clear%
hessian=load('./files/hessian.txt');
w=load('./files/eigenvectors.txt')*10;%%%%%row vectors
w_1=round(w);
atom=[1 2 6 7 11 12 13 14 18 46];
atom=[1  12 13 14 18  46];
dir=[];
for ii=1:size(atom,2)
    dir=[dir atom(1,ii)*3-2 atom(1,ii)*3-1 atom(1,ii)*3];
end
rest_w_1=w_1(:,dir);
fre_im_dir=[];
for ii=1:size(w_1,1)
    [C,I]=max(abs(w_1(ii,:)));
    if ismember(I,dir)==1 && C>1
        C 
        I
        fre_im_dir=[fre_im_dir;ii];
    end
end

