#`marcumq` function for Scilab

What is it?
-----------
This function calculates Marcum's Q function.<br>
    `Q_M(a,b) = 1/a^(m-1) \int_{b}^{\inf} x^m exp(-(x^2 + a^2)/2) I_{m-1} (ax) dx`<br>
    Where `I_(m-1) (x)` is modified bessel function. <br>
    The calculation has been done using the infinite Bessel series. The infinte series has truncated when the relative error is been less than 10<sup>-9</sup>.<br><br>
    This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.<br>

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('marcumq.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`q = marcumq(a, b, m)`
  - Input Arguments:
    * `a_vec`            :   Scalar or Vector or Matrix of values of `a`
    * `b_vec`            :   Scalar or Vector or Matrix of values of `b`
    * `m_vec`            :   Scalar or Vector or Matrix of values of `m`

  - Conditions:
    * `size(a_vec) == size(b_vec) == size(m_vec)` : The returned vector will be of `size(m_vec)` <br>
                                              where `q_vec(i) = marcumq(a_vec(i), b_vec(i), m_vec(i))`
    * If size of inputs `a_vec`, `m_vec` or `b_vec` is equal to [1 1] then it will be converted to size of other inputs that is not `[1 1]`.
    * If more than one input has size not equal to `[1 1]` and size of vectors are not same then error will be thrown.

  - Output:
    * `q`           :   Vector of size of inputs with values calculated by taking each individual elements<br>
                      from the inputs. i.e. `q(i) = marcumq(a(i), b(i), m(i))`
    
Example
-------
```
y = marcumq(1,2);
disp(y)
y = marcumq(1,2,2);
disp(y)
```

Output:
```
0.2690121
0.5544845
```
