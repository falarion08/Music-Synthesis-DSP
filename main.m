bpm = 120;
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat / 4;

fsamp = 21000;
dur = 1;

notes = theVoices(1).noteNumbers;
dur_per_note = theVoices(1).durations;
startPulse = theVoices(1).startPulses;

total_notes = length(notes);

xx = [];

for i=1:total_notes

    tone = key2note(1,notes(i), dur_per_note(i) * seconds_per_pulse,8000);
    zz = [xx,tone];

    if i + 1 <= total_notes
        delay = startPulse(i+1) - startPulse(i);
        delay = delay * seconds_per_pulse;
        % Insert a delay
        yy = [zz, zeros(1,200*ceil(delay))];
        zz = yy;
    end 
    xx = zz;
end
% dur = 23.6376 if for bach_fugue.mat
%dur = 5.1709 for bach_fugue_short.mat
% tt = 0:1/fsamp:5.1709;
% plot(tt, xx);

soundsc(xx, 8000);
spectrogram(xx,512,[],512,fsamp,'yaxis');