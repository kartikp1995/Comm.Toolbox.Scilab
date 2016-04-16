// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function alg = normlms(stepsize, varargin)
//  alg = normlms(stepsize, bias, leakage_factor)
    //  This function creates an AdaptiveAlgorithm Object for a Least Mean Square Algorithm 
    //      to use it with `lineareq` or `dfe` to create an equalizer object.
    //  NOTE: For now, the object is expressed as a structure type.
    //
    //  Input Arguments:
    //      stepsize         :   Any non-negative real number. It is StepSize parameter for LMS algorithm.
    //      bias             :   Normalized LMS bias parameter between 0 to 1. (Default = 0)
    //      leakage_factor   :   Real number between 0 to 1. It is Leakage Factor parameter for LMS algorithm. (Default = 1)

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
    //Condition check on bias and leakage_factor if provided
    if argn(2) == 2 then
        bias = varargin(1);
        leakage_factor = 1; // Default value of leakage_factor
        if bias ~= conj(bias) then  //Not real bias
            error(msprintf(gettext("Input bias parameter must be a real value between 0 to 1.")));
        end
        if bias > 1 | bias < 0 then  //bias between 0 to 1
            error(msprintf(gettext("Input bias must be a real value between 0 to 1.")));
        end
    elseif argn(2) == 3 then
        bias = varargin(1);
        leakage_factor = varargin(2);
        if bias ~= conj(bias) then  //Not real bias
            error(msprintf(gettext("Input bias parameter must be a real value between 0 to 1.")));
        end
        if bias > 1 | bias < 0 then  //bias between 0 to 1
            error(msprintf(gettext("Input bias must be a real value between 0 to 1.")));
        end
        if leakage_factor ~= conj(leakage_factor) then  //Not real leakage_factor
            error(msprintf(gettext("Input leakage_factor parameter must be a real value between 0 to 1.")));
        end
        if leakage_factor > 1 | leakage_factor < 0 then  //leakage_factor between 0 to 1
            error(msprintf(gettext("Input leakage_factor must be a real value between 0 to 1.")));
        end
    else
        bias = 0; //Default value of Bias
        leakage_factor = 1; //Default value of leakage_factor
    end
    // Input checks end
    
    alg = struct('AlgType', 'Normalized LMS', 'StepSize', stepsize, 'LeakageFactor', leakage_factor, 'Bias', bias);
    // NOTE: The output must be AdaptiveAlgorithm Object. But currently, it is implemented as a Structure type.
endfunction
