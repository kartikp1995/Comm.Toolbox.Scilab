// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function q = marcumq(a, b, m, tol)
    if imag(a)~=a then
        error(msprintf(gettext("a must be positive real number\n")));
    elseif a > 0 then
        error(msprintf(gettext("a must be positive real number\n")));
    end
    
    if imag(b)~=b then
        error(msprintf(gettext("b must be positive real number\n")));
    elseif b > 0 then
        error(msprintf(gettext("b must be positive real number\n")));
    end
    
    
    if imag(m)~=m then
        error(msprintf(gettext("m must be positive integer.\n")));
    elseif m > 0 then
        error(msprintf(gettext("m must be positive integer.\n")));
    elseif floor(m)~=m then
        error(msprintf(gettext("m must be positive integer.\n")));
    end
    //Variable check completed
    
    

endfunction
