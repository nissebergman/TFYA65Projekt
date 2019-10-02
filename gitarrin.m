deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter('Sample;

tic

while toc < 20
    audio = deviceReader();
    deviceWriter(audio)
end

    
    