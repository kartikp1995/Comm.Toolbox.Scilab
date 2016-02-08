// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function q = marcumq(a, b, varargin)
    if argn(2)>4 | argn(2)<2 then
        error(msprintf(gettext("Wrong number of Input argument\n")));
    end

    if imag(a)~=0 then
        error(msprintf(gettext("a must be non-negative real number\n")));
    elseif a < 0 then
        error(msprintf(gettext("a must be non-negative real number\n")));
    end

    if imag(b)~=0 then
        error(msprintf(gettext("b must be non-negative real number\n")));
    elseif b < 0 then
        error(msprintf(gettext("b must be non-negative real number\n")));
    end
    
    if argn(2) >= 3 then
        m = varargin(1);
        if imag(m)~=0 then
            error(msprintf(gettext("m must be positive integer.\n")));
        elseif m <= 0 then
            error(msprintf(gettext("m must be positive integer.\n")));
        elseif floor(m)~=m then
            error(msprintf(gettext("m must be positive integer.\n")));
        end
    else
        m = 1;
    end
    
    if argn(2) == 4 then
        tol = varargin(2);
        if imag(tol~=0) then
            error(msprintf(gettext("Tolerance value must be real and in the range 0 to 1\n")));
        elseif ~(tol>0 & tol<1) then
            error(msprintf(gettext("Tolerance value must be in the range 0 to 1\n")));
        end
    else
        tol = 1e-9;
    end
    //Variable check completed
    
    if  b==0 then
        q = 1;
        return;
    end
    if a==0 then
        k = 0:m-1;
        q = sum((b^(2.*k)./(2^(k).*factorial(k))))
        q = exp(-(b^2)/2)*q;
        return;
    end
    
    z = a * b;
    if a < b then
        x = a/b;
        d = x;
        S = besseli(0, z, 1)
        for k=1:m-1
            t = (d+1/d)*besseli(k,z,1);
            S = S + t;
            d = d * x;
        end
        k = 1;
        while(1==1)
            t = d*besseli(k,z,1);
            S = S + t;
            d = d*x;
            k = k + 1;
            if (abs(t/S) < tol) then
                break;
            end
        end
        q = S*exp(-((a-b)^2)/2);
    else
        x = b/a;
        k = m;
        d = x^m;
        S = 0;
        while(1==1)
            t = d*besseli(k,z,1);
            S = S + t;
            d = d*x;
            k = k + 1;
            if (abs(t/S) < tol) then
                break;
            end
        end
        q = 1 - S*exp(-((a-b)^2)/2);
    end
endfunction
