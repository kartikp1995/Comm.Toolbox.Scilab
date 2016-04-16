// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function eqobj = lineareq(nweights, alg, varargin)
    if argn(2) > 4 then
        error(msprintf(gettext("Invalid number of input argument\n")));
    end
    // Retrive arguments
    if argn(2) == 4 then
        sigconst = varargin(1);
        nsamp = varargin(2);
    elseif argn(2) == 3 then
        sigconst = varargin(1);
        nsamp = 1; //Default samples per symbol value
    else
        sigconst = [-1, 1]; //Default Signal constellation
        nsamp = 1; //Default samples per symbol value
    end
    // Argument check
    
    weights = zeros(1, nweights);
    weightinputs = zeros(1, nweights);
    resetBeforeFiltering = 1; //Default = 1;
    eqobj = struct('EqType', 'Linear Equalizer', 'AlgType', alg.AlgType, 'nWeights', nweights, 'nSampPerSym', nsamp,...
                                               'SigConst', sigconst, 'Weights', weights, 'WeightInputs', weightinputs,...
                                               'ResetBeforeFiltering', resetBeforeFiltering, 'NumSamplesProcessed', 0);
                                               
    // Specific values for some specific algorithms
    if alg.AlgType ~= 'Constant Modulus' then
        eqobj.RefTab = 1;   //Default RefTap value
    end
    
    if alg.AlgType ~= 'RLS' then
        eqobj.LeakageFactor = alg.LeakageFactor;
        if alg.AlgType == 'Variable Step Size LMS' then
            eqobj.StepSize = alg.InitStep*ones(1,nweights);
        else
            eqobj.StepSize = alg.StepSize;
        end
    else
        eqobj.InvCorrMatrix = alg.InvCorrInit*eye(nweights,nweights);
        eqobj.InvCorrInit = alg.InvCorrInit;
        eqobj.ForgetFactor = alg.ForgetFactor;
    end

    if alg.AlgType == 'Normalized LMS' then
        eqobj.Bias = alg.Bias;
    end
    
    if alg.AlgType == 'Variable Step Size LMS' then
        eqobj.InitStep = alg.InitStep;
        eqobj.IncStep = alg.IncStep;
        eqobj.MinStep = alg.MinStep;
        eqobj.MaxStep = alg.MaxStep;
    end
    // NOTE: The output must be Linear Equalizer Object. But currently, it is implemented as a Structure type.
endfunction
