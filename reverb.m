fileReader = dsp.AudioFileReader('gitarr.wav','SamplesPerFrame',1024);
deviceWriter = audioDeviceWriter('SampleRate', fileReader.SampleRate);

PreDelay = 0.1;
WetDryMix = 0.5;
DecayFactor = 0.5;
Diffusion = 0.5;

reverb = reverberator('PreDelay',PreDelay,'WetDryMix', WetDryMix,'DecayFactor', DecayFactor, 'Diffusion', Diffusion);

tic
while toc < 5
    audio = fileReader();
    audioWithReverb = reverb(audio);
    deviceWriter(audioWithReverb);
end
release(fileReader);