// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function q = marcumq(a, b, m, tol)
    if argn(2)>4 | argn(2)<2 then
        error(msprintf(gettext("Invalid use of the function marcumq")));
    end

    if imag(a)~=0 then
        error(msprintf(gettext("a must be non-negative real number\n")));
    elseif a > 0 then
        error(msprintf(gettext("a must be non-negative real number\n")));
    end
    
    if imag(b)~=0 then
        error(msprintf(gettext("b must be non-negative real number\n")));
    elseif b > 0 then
        error(msprintf(gettext("b must be non-negative real number\n")));
    end
    
    if imag(m)~=0 then
        error(msprintf(gettext("m must be positive integer.\n")));
    elseif m > 0 then
        error(msprintf(gettext("m must be positive integer.\n")));
    elseif floor(m)~=m then
        error(msprintf(gettext("m must be positive integer.\n")));
    end
    //Variable check completed
    
    if  b==0 then
        q = 1;
        return;
    end
    if a==0 then
        k = 1:m-1;
        q = sum((b^(2.*k)./(2^(k).*factorial(k))))
        q = exp(-(b^2)/2)*q;
        return;
    end
    
    z = a * b;
    if a<b then
        x = a/b;
        d = x;
        S = besseli(0, z, 1)
        for k=1:m-1
            t = (d+1/d)*besseli(k,z,1);
            S = S + t;
            d = d*x;
        end
        while(true)
            t = d*besseli(k,z,1);
            S = S + t;
            d = d*x;
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
        while(true)
            t = d*besseli(k,z,1);
            S = S + t;
            d = d*x;
            if (abs(t/S) < tol) then
                break;
            end
        end
        q = S*exp(-((a-b)^2)/2);
    end
endfunction
