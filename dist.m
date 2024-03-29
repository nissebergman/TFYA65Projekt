fileReader = dsp.AudioFileReader('gitarr.wav','SamplesPerFrame',1024);
deviceWriter = audioDeviceWriter('SampleRate', fileReader.SampleRate);

tic

distKnob = 0.9;

k = 2*distKnob/(1-distKnob)

while toc < 3
   audio = fileReader();
   audio = (1+k)*(audio)./(1+k*abs(audio))
   deviceWriter(audio);
end