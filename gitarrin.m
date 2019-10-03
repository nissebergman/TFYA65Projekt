deviceReader = audioDeviceReader;
deviceWriter = audioDeviceWriter;

tic

while toc < 20
    audio = deviceReader();
    deviceWriter(audio)
end

    
    