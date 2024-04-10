% Clear workspace, command window, and close all figures
clear;
clc;
close all;

% Define the directory containing the music samples
samplesDir = '/Users/banalavishwatejareddy/Downloads/Assignment 2&3/samples';

% List of music files to analyze
musicFiles = {'michael_jackson.mp3', 'dream_theater.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

% Perceptual estimation of tempo (to be filled with your own perceptual estimates)
perceptualTempo = [182,100,136,105,50];  % Fill this array with your perceptual estimates

% Loop through each music file to perform tempo estimation
for i = 1:length(musicFiles)
    % Construct the full path to the current audio file
    filePath = fullfile(samplesDir, musicFiles{i});
    
    % Read the audio file using miraudio
    audio = miraudio(filePath);
    
    % Estimate the tempo of the audio file computationally
    tempo = mirtempo(audio);
    estimatedTempo = mirgetdata(tempo);
    
    perceptual = perceptualTempo(i);
    % Display the computational and perceptual estimates
    fprintf('Music File: %s\n', musicFiles{i});
    fprintf('Computational Estimate: %.2f BPM\n', estimatedTempo);
    fprintf('Perceptual Estimate: %.2f BPM\n', perceptual);
    
    % Compute the discrepancy between computational and perceptual estimates
    discrepancy = abs(estimatedTempo - perceptual);
    fprintf('Discrepancy: %.2f BPM\n\n', discrepancy);
end
