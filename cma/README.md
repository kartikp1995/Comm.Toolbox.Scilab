#`cma` function for Scilab

What is it?
-----------
This function creates an AdaptiveAlgorithm Object for to use it with `lineareq` or `dfe` to create an equalizer object.<br>
    This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.<br>

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('cma.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`alg = cma(stepsize, leakage_factor)`
  - Input Arguments:
    * `stepsize`        :   Any non-negative real number. It is StepSize parameter for CMA algorithm.
    * `leakage_factor`  :   Real number between 0 to 1. It is Leakage Factor parameter for CMA algorithm. (Default = 1)

  - Output:
    * `alg`             :   Adaptive Alagorithm Object based on Input parameters. Implemented as a Structure type.
    
Example
-------
```
alg = cma(0.1,0.001)
```
Output:
```
alg  =
   AlgType: "Constant Modulus"
   StepSize: 0.1
   LeakageFactor: 0.001
```

License
-------
This file must be used under the terms of the CeCILL.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution.  The terms
are also available at    
[http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt](http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt)
