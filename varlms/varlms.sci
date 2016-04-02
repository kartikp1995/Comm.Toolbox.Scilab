// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function alg = varlms(initstep,incstep,minstep,maxstep, varargin)
//  alg = varlms(initstep,incstep,minstep,maxstep)
    //  This function creates an AdaptiveAlgorithm Object for Variable Size LMS Algortihm
    //    to use it with `lineareq` or `dfe` to create an equalizer object.
    //  NOTE: For now, the object is expressed as a structure type.
    //
    //  Input Arguments:
    //      initstep         :   Initial value of stepsize
    //      incstep          :   Increment in initial value of stepsize after every iteration
    //      minstep          :   Minimum value of stepsize
    //      maxstep          :   Maximum value of stepsize
    //      leakage_factor   :   Leakage Factor parameter for algorithm

    //  Output:
    //      alg              :   Adaptive Alagorithm Object based on Input parameters. Implemented as a Structure type.

    if argn(2) > 5 then
        error(msprintf(gettext("Invalid number of input argument\n")));
    end
    // Condition check on arguments
    if initstep ~= conj(initstep) then  //Not real initstep
        error(msprintf(gettext("Inputs must be non-negative real number")));
    end
    if incstep ~= conj(incstep) then  //Not real incstep
        error(msprintf(gettext("Inputs must be non-negative real number")));
    end
    if minstep ~= conj(minstep) then  //Not real minstep
        error(msprintf(gettext("Inputs must be non-negative real number")));
    end
    if maxstep ~= conj(maxstep) then  //Not real maxstep
        error(msprintf(gettext("Inputs must be non-negative real number")));
    end
    if minstep > maxstep then
        error(msprintf(gettext("Minstep must be less than Maxstep")));
    end
    if initstep < minstep | initstep > maxstep then
        error(msprintf(gettext("Initstep must be between Minstep and Maxstep")));
    end
    //Condition check on leakage_factor if provided
    if argn(2) == 5 then
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
    
    alg = struct('AlgType', 'Variable Step Size LMS', 'LeakageFactor', leakage_factor, 'InitStep', initstep, 'IncStep', incstep, 'MinStep', minstep, 'MaxStep', maxstep);
    // NOTE: The output must be AdaptiveAlgorithm Object. But currently, it is implemented as a Structure type.
endfunction
