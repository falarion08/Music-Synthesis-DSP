function yy = brass(f0,dur, fsamp)
%CLARINET produce a clarinet note signal
%
% usage: yy = clarinet(f0, Aenv, Ienv, dur, fsamp)
%
% where: f0 = note frequency
% Aenv = the array holding the A(t) envelope
% Ienv = the array holding the I(t) envelope
% dur = the amount of time the signal lasts
% fsamp = the sampling rate
Ts = 1/fsamp;
tt = 0 : Ts : dur;
[Aenv,Ienv] = woodwenv(0.2 * dur,dur * 0.7,dur *0.10,fsamp);

tt = tt(1:length(Aenv)); 
fc = 3 * f0;
fm = f0;

yy = Aenv .* cos(2*pi*fc.*tt + Ienv.*cos(2*pi*fm.*tt));
end 