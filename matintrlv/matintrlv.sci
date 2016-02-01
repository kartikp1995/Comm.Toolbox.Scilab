//Created by: Kartik Patel
//            Indian Institute of Technology, Roorkee
//Date      : 1 Feb, 2016
//License   : Creative Commons Attribution-ShareAlike 4.0 International License

function[y]=matintrlv(x, Nrows, Ncols)
    //  y = matintrlv(x, Nrows, Ncols)
    //  This function will permute the data by filling a matrix of size Nrows*Ncols row wise and
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
        temp_mat = zeros(rows, cols);   //Temporary matrix of size Nrows*Ncols
        for i=1:rows
            for j=1:cols
                temp_mat(i,j) = x(cols*(i-1)+j, m); //Row wise assignment of elements of X to temporary matrix
            end
        end
        
        k = 1;
        for j=1:cols
            for i=1:rows
                y(k,m)=temp_mat(i,j);   //Column wise assignment of elements of temporary matrix to output Y
                k = k + 1;
            end
        end
    end
