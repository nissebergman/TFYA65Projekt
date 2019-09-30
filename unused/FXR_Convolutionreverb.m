function FXR_Convolutionreverb(audiofile, IRfile, Reverbfile)

% L�s audiofilen
[input_audio,Fs] = audioread(audiofile);
left_input=input_audio; %[:,1];
right_input=input_audio;

% L�s impulsrespons
[imp,Fsimp] = audioread(IRfile);
left_imp=imp(:,1);
right_imp=imp(:,2);

% Do convolution with FFT%
out_left = FXR_fconv(left_input,left_imp);
out_right = FXR_fconv(right_input,right_imp);

output_data=[out_left out_right];


% write output
audiowrite(Reverbfile,output_data, Fs);
