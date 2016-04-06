// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function alg = signlms(stepsize, varargin)
//  alg = signlms(stepsize, alg_type, leakage_factor)
    //  This function creates an AdaptiveAlgorithm Object for a signed Least Mean Square Algorithm 
    //      to use it with `lineareq` or `dfe` to create an equalizer object.
    //  NOTE: For now, the object is expressed as a structure type.
    //
    //  Input Arguments:
    //      stepsize         :   Any non-negative real number. It is StepSize parameter for LMS algorithm.
    //      alg_type         :   Select algorithm from a set of signed LMS algortihms.
    //                           Options: 'Sign LMS' (default), 'Signed Regressor LMS', 'Sign Sign LMS'
    //      leakage_factor   :   Real number between 0 to 1. It is Leakage Factor parameter for CMA algorithm. (Default = 1)

    //  Output:
    //      alg              :   Adaptive Alagorithm Object based on Input parameters. Implemented as a Structure type.

    if argn(2) > 3 then
        error(msprintf(gettext("Invalid number of input argument\n")));
    end
    // Condition check on stepsize
    if stepsize ~= conj(stepsize) then  //Not real stepsize
        error(msprintf(gettext("Input stepsize must be non-negative real number")));
    end
    if stepsize < 0 then  //Negative stepsize
        error(msprintf(gettext("Input stepsize must be non-negative real number")));
    end
    //Condition check on alg_type if provided
    if argn(2) > 1 then
        alg_type = varargin(1);
        if alg_type ~= 'Sign LMS' & alg_type ~= 'Signed Regressor LMS' & alg_type ~= 'Sign Sign LMS' then
            error(msprintf(gettext("Invalid Algortihm choice")));
        end
        if argn(2) == 3 then
            leakage_factor = varargin(2);
            if leakage_factor ~= conj(leakage_factor) then  //Not real leakage_factor
                error(msprintf(gettext("Input leakage_factor must be a real value between 0 to 1.")));
            elseif leakage_factor > 1 | leakage_factor < 0 then  //Leakage_factor between 0 to 1
                error(msprintf(gettext("Input leakage_factor must be a real value between 0 to 1.")));
            end
        else
            leakage_factor = 1; //Default Value of Leakage_factor
        end
     else
         alg_type = 'Sign LMS';  //Default value of alg_type
         leakage_factor = 1;    //Default value of leakage_factor
    end
    // Input checks end
    
    alg = struct('AlgType', alg_type, 'StepSize', stepsize, 'LeakageFactor', leakage_factor);
    // NOTE: The output must be AdaptiveAlgorithm Object. But currently, it is implemented as a Structure type.
endfunction
