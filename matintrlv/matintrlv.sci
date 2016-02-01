//Created by: Kartik Patel
//            Indian Institute of Technology, Roorkee
//Date      : 1 Feb, 2016
//License   : Creative Commons Attribution-ShareAlike 4.0 International License

function[y]=matintrlv(x, rows, cols)

    for m=1:length(x(1,:))
        temp_mat = zeros(rows, cols);
        for i=1:rows
            for j=1:cols
                temp_mat(i,j) = x(cols*(i-1)+j, m);
            end
        end
        
        k = 1;
        for j=1:cols
            for i=1:rows
                y(k,m)=temp_mat(i,j);
                k = k + 1;
            end
        end
    end

