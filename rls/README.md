#`rls` function for Scilab

What is it?
-----------
This function creates an AdaptiveAlgorithm Object for Recursive Least Square Algorithm to use it with `lineareq` or `dfe` to create an equalizer object.<br>
    This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.<br>

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('rls.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`alg = rls(forgetfactor, invcorr0)`
  - Input Arguments:
    * `forgetfactor`        :   Any non-negative real number. It is forgetfactor parameter for RLS algorithm.
    * `invcorr0`  			:   Real number between 0 to 1. It sets initialisation parameter for inverse correlation matrix. (Default = 1)

  - Output:
    * `alg`             :   Adaptive Alagorithm Object based on Input parameters. Implemented as a Structure type.
    
Example
-------
```
alg = rls(0.1)
```
Output:
```
alg  =
	AlgType: "RLS"
	ForgetFactor: 0.1
	InvCorrInit: 1
```

License
-------
This file must be used under the terms of the CeCILL.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution.  The terms
are also available at    
[http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt](http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt)
