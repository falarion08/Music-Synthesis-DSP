function xx = bell(freq, dur,fsamp)
fc =freq *.35;
fm = fc * 2;
tt = 0:1/fsamp:dur;
Aenv = 1;
Ienv = 8;
tau =3;

yy = exp(-1.*tt ./ tau);


Ienv = Ienv .* yy;
Aenv = Aenv .* yy;

xx = Aenv.*cos(2*pi*fc.*tt + Ienv .* cos(2*pi*fm.*tt-pi/2)-pi/2);
end