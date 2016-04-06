#`signlms` function for Scilab

What is it?
-----------
This function creates an AdaptiveAlgorithm Object for Signed Least Mean Square Algorithm to use it with `lineareq` or `dfe` to create an equalizer object.<br>
    This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.<br>

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('signlms.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`alg = lms(stepsize, alg_type, leakage_factor)`
  - Input Arguments:
    * `stepsize`        :   Any non-negative real number. It is StepSize parameter for LMS algorithm.
    * `alg_type`        :   Select algorithm from a set of signed LMS algortihms.
                            Options: `'Sign LMS'` (default), `'Signed Regressor LMS'`, `'Sign Sign LMS'`
    * `leakage_factor`  :   Real number between 0 to 1. It is Leakage Factor parameter for LMS algorithm. (Default = 1)

  - Output:
    * `alg`             :   Adaptive Alagorithm Object based on Input parameters. Implemented as a Structure type.
    
Example
-------
```
alg = signlms(0.1, 'Sign Sign LMS')
```
Output:
```
alg  =
   AlgType: "Sign Sign LMS"
   StepSize: 0.1
   LeakageFactor: 1
```

License
-------
This file must be used under the terms of the CeCILL.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution.  The terms
are also available at    
[http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt](http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt)
