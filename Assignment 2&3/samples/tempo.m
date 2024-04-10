clear;
clc;
close all;

samplesDir = '/Users/banalavishwatejareddy/Downloads/Assignment 2&3/samples';

% List of music files to analyze
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

% Loop through each music file to perform tempo estimation
for i = 1:length(musicFiles)
    % Construct the full path to the current audio file
    filePath = fullfile(samplesDir,musicFiles{i});
    
    % Read the audio file using miraudio
    audio = miraudio(filePath);
    
    % Estimate the tempo of the audio file
    tempo = mirtempo(audio);
    
    % Display the estimated tempo
    fprintf('Estimated tempo for %s: ', musicFiles{i});
    mirgetdata(tempo)
    % mirplay(audio);
end