%% Reverb

PreDelay            = 0.0000; %start late
HighCutFrequency    = 20000;
Diffusion           = 0.5; %blur
DecayFactor         = 0.5; %echo lifetime
HighFrequencyDamping= 5e-04; % 0<x<1
WetDryMix           = 1; %0=Dry, 1=Wet
SampleRate          = 44100; %quality

reverb = reverberator('PreDelay',PreDelay,'HighCutFrequency',HighCutFrequency,'Diffusion',Diffusion,'DecayFactor',DecayFactor,'HighFrequencyDamping',HighFrequencyDamping,'WetDryMix',WetDryMix,'SampleRate',SampleRate);
[x,fs] = audioread('gitarr.wav'); %ny version
y = reverb(x);

player = audioplayer(y,fs);
play(player);
pause(1.5); %seconds
stop(player);

%% Delay

Delay        = 0.1 % Base delay in seconds
%Gain          % Amplitude gain 
FeedbackLevel = 0.35% Feedback gain 
WetDryMix  = 0.5   % Wet to dry signal ratio
%SampleRate =   % Sample rate of the input audio signal

%ECHO = audiopluginexample.Echo('Delay',Delay);%'Delay',Delay);
ECHO = audioexample.Echo('Delay',Delay,'FeedbackLevel',FeedbackLevel,'WetDryMix',WetDryMix);%'Delay',Delay);
[x,fs] = audioread('gitarr.wav');
y = ECHO(x);

player = audioplayer(y,fs);
play(player);
pause(1.5); %seconds
stop(player);

%% Flanger
FLANGER = audiopluginexample.Flanger();
%duration = 30; % in seconds
audioDelayEffectsExampleApp('flanger',duration);
[x,fs] = audioread('gitarr.wav');
y = process(FLANGER, x);

player = audioplayer(y,fs);
play(player);
pause(1.5); %seconds
stop(player);
