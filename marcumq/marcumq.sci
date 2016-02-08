// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function q_vec = marcumq(a_vec, b_vec, varargin)
//  q = marcumq(a, b, m, tol)
    //  This function calculates Marcum's Q function.
    //  Q_M(a,b) = 1/a^(m-1) \int_{b}^{\inf} x^m exp(-(x^2 + a^2)/2) I_{m-1} (ax) dx
    //          Where I_{m-1} (x) is modified bessel function.
    //
    //  The calculation has been done using the infinite Bessel series. The infinte series has
    //  truncated when the relative error is been less than specified tolerance.
    //
    //  Input Arguments:
    //      a_vec            :   Scalar or Vector or Matrix of values of a
    //      b_vec            :   Scalar or Vector or Matrix of values of b
    //      m                :   Scalar or Vector or Matrix of values of m
    //      tol              :   Tolerance value to stop the calculation after a specific time.
    //                           Default: 1e-9

    //  Conditions:
    //      size(a_vec) == size(b_vec) == size(m_vec) : The returned vector will be of size(m_vec)
    //                                                  where q_vec(i) = marcumq(a_vec(i), b_vec(i), m_vec(i))
    //      If size of inputs a_vec, m_vec or b_vec is equal to [1 1] then
    //              it will be converted to size of other inputs that is not [1 1].
    //      If more than one input has size not equal to [1 1] and size of vectors are not same then
    //              error will be thrown.

    //  Output:
    //      q           :   Vector of input size
    //
    //  Reference:
    //  [1] R. T. Short, "Computation of Noncentral Chi-squared and Rice Random Variables", 
    //      http://www.phaselockedsystems.com/NoncentralChiSquared.pdf


    if argn(2)>4 | argn(2)<2 then
        error(msprintf(gettext("Wrong number of Input argument\n")));
    end

    if or(imag(a_vec)~=0) then
        error(msprintf(gettext("a must be non-negative real number\n")));
    elseif or(a_vec < 0) then
        error(msprintf(gettext("a must be non-negative real number\n")));
    end

    if or(imag(b_vec)~=0) then
        error(msprintf(gettext("b must be non-negative real number\n")));
    elseif or(b_vec < 0) then
        error(msprintf(gettext("b must be non-negative real number\n")));
    end
    
    if size(a_vec) == [1 1] then
        a_vec = repmat(a_vec, size(b_vec));
    elseif size(b_vec) == [1 1] then
        b_vec = repmat(b_vec, size(a_vec));
    elseif ~isequal(size(a_vec), size(b_vec)) then
        error(msprintf(gettext("Dimensions of input vectors must be same\n")));
    end

    if argn(2) >= 3 then
        m_vec = varargin(1);
        if or(imag(m_vec)~=0) then
            error(msprintf(gettext("m_vec must be positive integer.\n")));
        elseif or(m_vec <= 0) then
            error(msprintf(gettext("m_vec must be positive integer.\n")));
        elseif or(floor(m_vec)~=m_vec) then
            error(msprintf(gettext("m_vec must be positive integer.\n")));
        end
        if size(m_vec) == [1 1] then
            m_vec = repmat(m_vec, size(a_vec));
        else
            if size(a_vec) == [1 1] then
                a_vec = repmat(a_vec, size(m_vec));
                b_vec = repmat(b_vec ,size(m_vec));
            else
                error(msprintf(gettext("Dimensions of input vectors must be same\n")));
            end
        end
    else
        m_vec = ones(size(a_vec));
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
    
    q_vec = zeros(size(a_vec));
    for i = 1:prod(size(a))
        b = b_vec(i);
        a = a_vec(i);
        m = m_vec(i);
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
        q_vec(i) = q;
    end
endfunction
