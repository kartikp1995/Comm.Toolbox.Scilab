// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function alg = cma(stepsize, varargin)
//This function creates an AdaptiveAlgorithm Object for a Constant Modulus Algortihm to use it with `lineareq` or `dfe` to create an equalizer object.
//NOTE: For now, the object is expressed as a structure type.
//Calling Sequence
//alg = cma(stepsize, leakage_factor)
//Parameters
//stepsize:double-Any non-negative real number. It is StepSize parameter for CMA algorithm.
//leakage_factor:double-Real number between 0 to 1. It is Leakage Factor parameter for CMA algorithm. (Default = 1)
//Examples
//alg = cma(0.1,0.001)
//Authors
//Kartik Patel

    if argn(2) > 2 then
        error(msprintf(gettext("Invalid number of input argument\n")));
    end
    // Condition check on stepsize
    if stepsize ~= conj(stepsize) then  //Not real stepsize
        error(msprintf(gettext("Input stepsize must be non-negative real number")));
    end
    if stepsize < 0 then  //Negative stepsize
        error(msprintf(gettext("Input stepsize must be non-negative real number")));
    end
    //Condition check on leakage_factor if provided
    if argn(2) == 2 then
        leakage_factor = varargin(1);
        if leakage_factor ~= conj(leakage_factor) then  //Not real leakage_factor
            error(msprintf(gettext("Input leakage_factor must be a real value between 0 to 1.")));
        end
        if leakage_factor > 1 | leakage_factor < 0 then  //Leakage_factor between 0 to 1
            error(msprintf(gettext("Input leakage_factor must be a real value between 0 to 1.")));
        end
     else
         leakage_factor = 1;  //Default value of leakage_factor
    end
    // Input checks end
    
    alg = struct('AlgType', 'Constant Modulus', 'StepSize', stepsize, 'LeakageFactor', leakage_factor);
    // NOTE: The output must be AdaptiveAlgorithm Object. But currently, it is implemented as a Structure type.
endfunction
