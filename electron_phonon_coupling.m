clear
energy=load('./files/energy_move_eigenvector');
E=[ -.35541740E+03    -.35541550E+03];
delta_F=energy(:,3)-repmat(E(1,1),size(energy,1),1);
delta_E0=energy(:,4)-repmat(E(1,2),size(energy,1),1);
[C,I]=max(abs(delta_E0))
