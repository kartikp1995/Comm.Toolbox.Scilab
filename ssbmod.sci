function[y]=ssbmod(x, Fc, Fs, varargin)
    if imag(x)~=0 then
        disp('Input vector must be real.')
        return
    end
    if imag(Fc)~=0 or Fc<=0 then
        disp('Carrier Frequency must be positive real number.')
        return
    end
    if imag(Fs)~=0 or Fs<=0 then
        disp('Sampling Frequency must be positive real number.')
        return
    end
    if (Fs<=2*Fc) then
        disp('Sampling Frequency must be atleast twice of Carrier Frequency');
        return
    end
    
    iniph = 0;
    upper = 0~=0;
    if argn(2)>=4 then
        iniph = varargin(1);
        if length(iniph) == 0 then
            iniph = 0;
        elseif ~isreal(iniph) then
            disp('Initial Phase of the signal must be a real quantity');
            return
        elseif length(iniph)>1 then
            disp('Initial Phase of the signal must be a scalar quantity');
            return
        end
        if argn(2)==5 then
            upper_string = varargin(2);
            compare = strcmpi(upper_string, 'upper')
            if compare~=0 then
                disp('Invalid string');
                return
            else
                upper = 0==0;
            end
        end
    end
    
    if size(x,1)==1 then
        x = x(:)
    end
    
    t = (0:1/Fs:(size(x,1)-1)./Fs)';
    t = t(:,ones(1,size(x,2)));
    
    if upper then
        y = x.*cos(2*%pi*Fc*t + iniph) - imag(hilbert(x)).*sin(2*%pi*Fc*t + iniph);
    else
        y = x.*cos(2*%pi*Fc*t + iniph) + imag(hilbert(x)).*sin(2*%pi*Fc*t + iniph);
    end
endfunction
