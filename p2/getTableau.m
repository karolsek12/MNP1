function [B,C] = getTableau(table)

if(table == 0)

    B = [   
        0  0 0 0;
      1/3  0 0 0;
     -1/3  1 0 0;
        1 -1 1 0];

    C = [1/8,3/8,3/8,1/8];
else

    B = [   
        0   0 0 0;
      1/2   0 0 0;
        0 1/2 0 0;
        0   0 1 0];

    C = [1/6,1/3,1/3,1/6]; 

end

end