#`matintrlv` for Scilab

What is it?
-----------
This function rearranges the data by filling a matrix row wise and emptying it column wise. i.e. Symbols of input are filled in temporary matrix rowwise. The same temporary matrix will be emptied columnwise. Resulting permutation is returned. This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('matintrlv.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`y = matintrlv(x, Nrows, Ncols)`
  - Input Arguments:
    * `x`           :   Input Data
    * `Nrows`       :   Number of Rows of temporary matrix
    * `Ncols`       :   Number of Cols of temporary matrix

  - Conditions:
    * `Nrows*Ncols == length(x)`: Condition for each column of matrix X to be same as number of elements in temporary matrix

  - Output:
    * `y`           :   Rearranged matrix
    
Example
-------
```
y = matintrlv([1 2 3 4 5 6; 7 8 9 10 11 12]', 2, 3);
disp(y)
```

Output:
```
1.	7.
4.	10.
2.	8.
5.	11.
3.	9.
6.	12.
```
