#Single Sideband Modulation for Scilab

What is it?
-----------
This function generates a Single Sideband Modulated signal for given Modulating signal and Carrier frequency. This function has been developed for Communication toolbox in Scilab under Project FOSSEE Toolbox.

Usage
-----
- Change current directory to `path/to/function/`.
- In Scilab prompt, run: `exec('ssbmod.sci')`. This will load the function in environment.<br>
The function is tested on Scilab 5.5.2. There is no specific OS requirement.

Instructions
------------
`y = ssbmod(x, Fc, Fs, init_phase, 'upper')`
  - Input Arguments:
    * `x`           :   Modulating signal
    * `Fc`          :   Carrier Frequency of Modulated signal
    * `Fs`          :   Sampling Frequency of Input signal
    * `init_phase`  :   Initial Phase of Modulated signal (default = 0, optional)
    * `'upper'`     :   Upper SideBand modulated signal   (default=`'lower'`, optional)<br>
                      For lower sideband, this argument can be blank.
  - Conditions:
    * `Fs > 2*(Fc+BW)`, where BW is bandwidth of Modulating Signal
  - Output:
    * `y`           :   Single Sideband Modulated signal
    
Example
-------
```
Fs = 1000; //Sampling Frequency: 1 kHz
t = 0:1/Fs:2; //Samples for 2 seconds
x = cos(2*%pi*50*t)+cos(2*%pi*10*t)+cos(2*%pi*20*t);
Fc = 200; //Carrier Frequency: 400 Hz
y_lower = ssbmod(x, Fc, Fs);
y_upper = ssbmod(x, Fc, Fs, 0, 'upper');

fft_lower = abs(fft(y_lower));
fft_lower = fft_lower(1:length(fft_lower)/2+1);
frqz = (0:length(fft_lower)-1)*Fs/(2*length(fft_lower));

fft_upper = abs(fft(y_upper));
fft_upper = fft_upper(1:length(fft_upper)/2+1);
frqz = (0:length(fft_upper)-1)*Fs/(2*length(fft_upper));

plot(frqz, fft_upper);
plot(frqz, fft_lower, 'r');
legend('Upper Sideband', 'Lower Sideband');
title('Single Sideband Modulation results');
```

Output:
![Example Result](https://raw.githubusercontent.com/kartikp1995/Comm.Toolbox.Scilab/master/ssbmod/example.jpg)

License
-------
This file must be used under the terms of the CeCILL.
This source file is licensed as described in the file COPYING, which
you should have received as part of this distribution.  The terms
are also available at    
[http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt](http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt)
