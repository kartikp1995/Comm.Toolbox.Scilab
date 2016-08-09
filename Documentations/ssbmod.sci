// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) Scilab Enterprises - 20xx-2012 - Kartik PATEL <kartikpatel1995@gmail.com>
// 
// This file must be used under the terms of the CeCILL.
// This source file is licensed as described in the file COPYING, which
// you should have received as part of this distribution.  The terms
// are also available at    
// http://www.cecill.info/licences/Licence_CeCILL_V2-en.txt

function[y]=ssbmod(x, Fc, Fs, varargin)
//This function will generate the single sideband modulated signal with modulating singal x and carrier frequency Fc.
//Calling Sequence
//y = ssbmod(x, Fc, Fs, init_phase, 'upper')
//Parameters
//x:Modulating signal
//Fc:Carrier Frequency of Modulated signal
//Fs:Sampling Frequency of Input signal
//init_phase:Initial Phase of Modulated signal (default = 0, optional)
//'upper':Upper SideBand modulated signal   (default='lower', optional). For lower sideband, this argument can be blank.
//Examples
//Fs = 1000; //Sampling Frequency: 1 kHz
//t = 0:1/Fs:2; //Samples for 2 seconds
//x = cos(2*%pi*50*t)+cos(2*%pi*10*t)+cos(2*%pi*20*t);
//Fc = 200; //Carrier Frequency: 400 Hz
//y_lower = ssbmod(x, Fc, Fs);
//y_upper = ssbmod(x, Fc, Fs, 0, 'upper');
//
//fft_lower = abs(fft(y_lower));
//fft_lower = fft_lower(1:length(fft_lower)/2+1);
//frqz = (0:length(fft_lower)-1)*Fs/(2*length(fft_lower));
//
//fft_upper = abs(fft(y_upper));
//fft_upper = fft_upper(1:length(fft_upper)/2+1);
//frqz = (0:length(fft_upper)-1)*Fs/(2*length(fft_upper));
//
//plot(frqz, fft_upper);
//plot(frqz, fft_lower, 'r');
//legend('Upper Sideband', 'Lower Sideband');
//title('Single Sideband Modulation results');
//Authors
//Kartik Patel

    if imag(x)~=0 then
        //Check for real input signal
        disp('Input vector must be real.')
        return
    end
    if imag(Fc)~=0 or Fc<=0 then
        //Check for positive real Fc
        disp('Carrier Frequency must be positive real number.')
        return
    end
    if imag(Fs)~=0 or Fs<=0 then
        //Check for positive real Fs
        disp('Sampling Frequency must be positive real number.')
        return
    end
    if (Fs<=2*Fc) then
        //Check for Fs>2*Fc
        disp('Sampling Frequency must be atleast twice of Carrier Frequency');
        return
    end
    
    iniph = 0; //Default Initial Phase = 0
    upper = 0~=0;   //Default method is not upper
    if argn(2)>=4 then  //Initial Phase and/or 'Upper' is provided
        iniph = varargin(1);   //Initial Phase
        if length(iniph) == 0 then
            //Check for blank
            iniph = 0;
        elseif ~isreal(iniph) then
            //Check for real value
            disp('Initial Phase of the signal must be a real quantity');
            return
        elseif length(iniph)>1 then
            //Check for scalar quantity
            disp('Initial Phase of the signal must be a scalar quantity');
            return
        end
        if argn(2)==5 then  //Whether Method is provided
            upper_string = varargin(2);
            compare = strcmpi(upper_string, 'upper')    //If Method == 'upper'
            if compare~=0 then
                //If Method != 'upper'
                disp('Invalid string');
                return
            else
                upper = 0==0;   //upper = True
            end
        end
    end
    //Variable checks completed
    
    if size(x,1)==1 then
        x = x(:)    //Making sure that x is a column vector
    end
    
    t = (0:1/Fs:(size(x,1)-1)./Fs)';
    t = t(:,ones(1,size(x,2))); //For 2D vector x, each column will be assumed to be a seperate channel
    
    if upper then   //Upper Sideband
        y = x.*cos(2*%pi*Fc*t + iniph) - imag(hilbert(x)).*sin(2*%pi*Fc*t + iniph);
    else    //Lower Sideband
        y = x.*cos(2*%pi*Fc*t + iniph) + imag(hilbert(x)).*sin(2*%pi*Fc*t + iniph);
    end
    //End of Function
endfunction
