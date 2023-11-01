function xx = key2note(X, keynum, dur,fs)
% KEY2NOTE Produce a sinusoidal waveform corresponding to a
% given piano key number
%
% usage: xx = key2note (X, keynum, dur)
%
% xx = the output sinusoidal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi).
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
%
    %-- or use 8000 Hz
tt = 0:(1/fs):dur;
freq = 440*2^((keynum - 49)/12);

length_tt = length(tt);
attack = linspace(0,1.2,length_tt*.10);
decay = linspace(1.2,1,length_tt * 0.10);
sustain = linspace(1, 0.9, length_tt * 0.60);
release = linspace(0.9,0, length_tt * 0.2);
adsr = [attack,decay,sustain,release];

xx = real( X*exp(1i*2*pi*freq*tt) );
xx = xx(1:length(adsr));
xx = adsr.*xx;