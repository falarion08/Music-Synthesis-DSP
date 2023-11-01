function yy = echo_reverb(xx, fsamp)
%Produces 4 echoes

P = floor(fsamp * 0.25);
alpha = 0.95;
bb = zeros(1,P);

bb(1) = 1 / (1 + alpha);
bb(P) = alpha / (1 + alpha);

yy = firfilt(bb,xx);
yy = firfilt(bb,yy);
yy = firfilt(bb,yy);
yy = firfilt(bb,yy);

end