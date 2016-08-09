// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function alg = rls(forgetfactor, varargin)
//This function creates an AdaptiveAlgorithm Object for a Recursive Least Square Algorithm to use it with `lineareq` or `dfe` to create an equalizer object.
//  NOTE: For now, the object is expressed as a structure type.
//Calling Sequence
//alg = rls(forgetfactor, invcorr0)
//Parameters
//forgetfactor:Any non-negative real number. It is forgetfactor parameter for RLS algorithm.
//invcorr0:Real number between 0 to 1. It sets initialisation parameter for inverse correlation matrix. (Default = 1)
//Examples
//alg = rls(0.1)
//Authors
//Kartik Patel

    if argn(2) > 2 then
        error(msprintf(gettext("Invalid number of input argument\n")));
    end
    // Condition check on stepsize
    if forgetfactor ~= conj(forgetfactor) then  //Not real forgetfactor
        error(msprintf(gettext("Input forgetfactor must be real number between 0 and 1.")));
    end
    if forgetfactor < 0 | forgetfactor > 1 then  //Invalid forgetfactor
        error(msprintf(gettext("Input stepsize must be non-negative real number")));
    end
    //Condition check on invcorr0 if provided
    if argn(2) == 2 then
        invcorr0 = varargin(1);
     else
        invcorr0 = 1;  //Default value of invcorr0 to a scalar
    end
    // Input checks end
    
    alg = struct('AlgType', 'RLS', 'ForgetFactor', forgetfactor, 'InvCorrInit', invcorr0);
    // NOTE: The output must be AdaptiveAlgorithm Object. But currently, it is implemented as a Structure type.
endfunction
