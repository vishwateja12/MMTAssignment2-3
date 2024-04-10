clear;
clc;
close all;


% Define the directory containing the music samples
samplesDir = '/Users/banalavishwatejareddy/Downloads/Assignment 2&3/samples';

% List of music files to analyze
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

% Loop through each music file to perform tempo estimation and synchronization
for i = 1:length(musicFiles)
    % Construct the full path to the current audio file
    filePath = fullfile(samplesDir, musicFiles{i});
    
    % Read the audio file using miraudio
    audio = miraudio(filePath);
    
    % Estimate the tempo of the audio file
    tempo = mirtempo(audio);
    
    % Display the estimated tempo
    estimatedTempo = mirgetdata(tempo);
    fprintf('Estimated tempo for %s: %.2f BPM\n', musicFiles{i}, estimatedTempo);
    
    % Set up the metronome with the estimated tempo
    metronomeBPM = estimatedTempo;
    metronomeDuration = 10; % Duration of the metronome in seconds
    metronomeSamples = generateMetronome(metronomeBPM, metronomeDuration, 44100);
    
    % Play the metronome alongside the music
    fprintf('Playing metronome at %.2f BPM...\n', metronomeBPM);
    sound(metronomeSamples, 44100);
    
    % Pause to allow time to listen to the metronome
    pause(metronomeDuration);
    
    % Stop the metronome
    clear sound;
    
    % Prompt user to continue or analyze next music file
    fprintf('Press any key to analyze the next music file...\n');
    pause;
end

% Function to generate metronome samples
function metronomeSamples = generateMetronome(BPM, duration, samplingRate)
    % Calculate the time between clicks based on the BPM
    clickInterval = 60 / BPM; % in seconds

    % Calculate the number of samples between clicks
    clickIntervalSamples = round(clickInterval * samplingRate);

    % Generate the metronome sound
    numClicks = ceil(duration / clickInterval); % Number of clicks to cover the duration
    metronomeSamples = zeros(1, numClicks * clickIntervalSamples);
    for i = 1:numClicks
        startIdx = (i - 1) * clickIntervalSamples + 1;
        endIdx = startIdx + clickIntervalSamples - 1;
        metronomeSamples(startIdx:endIdx) = 1; % Set the samples to 1 (click)
    end
end
