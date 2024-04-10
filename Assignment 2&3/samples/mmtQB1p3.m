% Clear workspace, command window, and close all figures
clear;
clc;
close all;

% Define the directory containing the music samples
samplesDir = '/Users/banalavishwatejareddy/Downloads/Assignment 2&3/samples';

% List of music files to analyze
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

% Loop through each music file to perform tempo analysis
for i = 1:length(musicFiles)
    % Construct the full path to the current audio file
    filePath = fullfile(samplesDir, musicFiles{i});
    
    % Read the audio file using miraudio
    audio = miraudio(filePath);
    
    % Perform frame-based tempo analysis with a frame length of at least 2 seconds
    tempo = mirtempo(audio, 'Frame', 2);
    
    % Get the time series of tempo values
    tempoTimeSeries = get(tempo, 'Data');
    
    % Convert tempo time series to a numeric array
    tempoValues = mirgetdata(tempo);
    
    % Compute the range of tempo variation
    minTempo = min(tempoValues);
    maxTempo = max(tempoValues);
    
    % Display the range of tempo variation
    fprintf('Music File: %s\n', musicFiles{i});
    fprintf('Range of Tempo Variation: %.2f BPM to %.2f BPM\n\n', minTempo, maxTempo);
end
