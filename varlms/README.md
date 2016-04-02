#`varlms` function for Scilab

What is it?
-----------
This function creates an AdaptiveAlgorithm Object for Variable Step Size LMS to use it with `lineareq` or `dfe` to create an equalizer object.<br>
    This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.<br>

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('cma.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`alg = varlms(initstep, incstep, minstep, maxstep, leakage_factor)`
  
  - Input Arguments:
    *   `initstep`         :   Initial value of stepsize
    *   `incstep`          :   Increment in initial value of stepsize after every iteration
    *   `minstep`          :   Minimum value of stepsize
    *   `maxstep`          :   Maximum value of stepsize
    *	`leakage_factor`   :   Leakage Factor parameter for algorithm (Default = 1)
  
  - Output:
    * `alg`                :   Adaptive Alagorithm Object based on Input parameters. Implemented as a Structure type.
    
Example
-------
```
alg = varlms(0.1, 0.01, 0.001, 1)
```
Output:
```
alg  =
   AlgType: "Variable Step Size LMS"
   LeakageFactor: 1
   InitStep: 0.1
   IncStep: 0.01
   MinStep: 0.001
   MaxStep: 1
```

License
-------
This file must be used under the terms of the CeCILL.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution.  The terms
are also available at    
[http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt](http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt)
