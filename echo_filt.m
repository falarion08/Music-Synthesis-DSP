function echo = echo_filt(xx,fsamp)
P = floor(fsamp * 0.2);
bb = zeros(1,P);
bb(1) = 1;
bb(P) = 0.9; 
echo = firfilt(bb,xx);
end