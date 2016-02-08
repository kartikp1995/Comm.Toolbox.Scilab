// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function[y]=matintrlv(x, Nrows, Ncols)
    //  y = matintrlv(x, Nrows, Ncols)
    //  This function rearranges the data by filling a matrix of size Nrows*Ncols row wise and
    //  emptying it column wise. i.e. Symbols of X are filled in temporary matrix rowwise. The same
    //  temporary matrix will be emptied columnwise. Resulting permutation is stored in Y.
    //
    //  Nrows and Ncols are dimensions of temporary matrix.
    //
    //  Input Arguments:
    //      x           :   Input Data
    //      Nrows       :   Number of Rows of temporary matrix
    //      Ncols       :   Number of Cols of temporary matrix
    //  Conditions:
    //      Nrows*Ncols == length(x)    :   Condition for each column of matrix X to be same as number of 
    //                                      elements in temporary matrix
    //
    //  Output:
    //      y           :   Rearranged matrix
    
    if size(x)==[0 0] then
        disp('Empty input data is not valid.');
        return;
    end
    
    if size(x,1)==1 then
        x = x(:);   //Remove the requirement of Transpose if only row vector is given
    end
    
    if size(Nrows)~=[1 1] then
        disp('Nrows value must be scalar.');
        return;
    end
    if size(Ncols)~=[1 1] then
        disp('Ncols value must be scalar.');
        return;
    end
    if type(Nrows)~=type(1) then
        disp('Nrows must be numerical value.');
        return;
    end
    if type(Ncols)~=type(1) then
        disp('Ncols must be numerical value.');
        return;
    end
    
    if size(x,1)~=Nrows*Ncols then
        disp('Length of data must be equal to product of rows and columns')
        return;
    end
    //Variable checks completed
    
    //Core function
    for m=1:length(x(1,:))  //Traverse each column
        temp_mat = zeros(Nrows, Ncols);   //Temporary matrix of size Nrows*Ncols
        for i=1:Nrows
            for j=1:Ncols
                temp_mat(i,j) = x(Ncols*(i-1)+j, m); //Row wise assignment of elements of X to temporary matrix
            end
        end
        
        k = 1;
        for j=1:Ncols
            for i=1:Nrows
                y(k,m)=temp_mat(i,j);   //Column wise assignment of elements of temporary matrix to output Y
                k = k + 1;
            end
        end
    end
