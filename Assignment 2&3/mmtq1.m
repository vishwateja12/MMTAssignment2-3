clear;
clc;
close all;

% Define the frequencies for D, E, and G
D_freq = 293.5; % Hz
E_freq = 329.5; % Hz
G_freq = 392.0; % Hz

% Duration for each note in seconds
note_duration = 0.5;

% Sampling rate (samples per second)
sampling_rate = 44100;

% Number of harmonics
num_harmonics = 10;

% Create the melody sequence
melody = {'D', 'E', 'G', 'G', 'G', 'G', 'G', 'G', ...
                'G', 'D', 'E', 'G', 'G', 'G', 'G', 'G', ...
                'G', 'D', 'E', 'G'};

%% Melody ALL

% Generate the combined waveform for the melody
combined_wave = zeros(1, note_duration * sampling_rate * length(melody));
for i = 1:length(melody)
    freq = 0;
    if strcmp(melody{i}, 'D')
        freq = D_freq;
    elseif strcmp(melody{i}, 'E')
        freq = E_freq;
    elseif strcmp(melody{i}, 'G')
        freq = G_freq;
    end
    
    % Generate sine wave for the current note with multiple harmonics
    note_wave = zeros(1, note_duration * sampling_rate);
    for h = 1:num_harmonics
        t = (0:(note_duration * sampling_rate - 1)) * (1/sampling_rate);
        note_wave = note_wave + sin(2 * pi * freq * h * t);
    end
    
    % Add the current note to the combined waveform
    start_index = (i - 1) * note_duration * sampling_rate + 1;
    end_index = start_index + note_duration * sampling_rate - 1;
    combined_wave(start_index:end_index) = combined_wave(start_index:end_index) + note_wave;
end

% Normalize the combined wave
combined_wave = combined_wave / max(abs(combined_wave));

% Play the generated sound
sound(combined_wave, sampling_rate);


%% Melody ODD

num_harmonics = 7;
% Generate the combined waveform for the melody
combined_wave = zeros(1, note_duration * sampling_rate * length(melody));
for i = 1:length(melody)
    freq = 0;
    if strcmp(melody{i}, 'D')
        freq = D_freq;
    elseif strcmp(melody{i}, 'E')
        freq = E_freq;
    elseif strcmp(melody{i}, 'G')
        freq = G_freq;
    end
    
    % Generate sine wave for the current note with multiple harmonics
    note_wave = zeros(1, note_duration * sampling_rate);
    for h = 3:2:num_harmonics
        t = (0:(note_duration * sampling_rate - 1)) * (1/sampling_rate);
        note_wave = note_wave + sin(2 * pi * freq * h * t);
    end
    
    % Add the current note to the combined waveform
    start_index = (i - 1) * note_duration * sampling_rate + 1;
    end_index = start_index + note_duration * sampling_rate - 1;
    combined_wave(start_index:end_index) = combined_wave(start_index:end_index) + note_wave;
end

% Normalize the combined wave
combined_wave = combined_wave / max(abs(combined_wave));

% Play the generated sound
sound(combined_wave, sampling_rate);

%% Melody Even

num_harmonics = 6;
% Generate the combined waveform for the melody
combined_wave = zeros(1, note_duration * sampling_rate * length(melody));
for i = 1:length(melody)
    freq = 0;
    if strcmp(melody{i}, 'D')
        freq = D_freq;
    elseif strcmp(melody{i}, 'E')
        freq = E_freq;
    elseif strcmp(melody{i}, 'G')
        freq = G_freq;
    end
    
    % Generate sine wave for the current note with multiple harmonics
    note_wave = zeros(1, note_duration * sampling_rate);
    for h = 2:2:num_harmonics
        t = (0:(note_duration * sampling_rate - 1)) * (1/sampling_rate);
        note_wave = note_wave + sin(2 * pi * freq * h * t);
    end
    
    % Add the current note to the combined waveform
    start_index = (i - 1) * note_duration * sampling_rate + 1;
    end_index = start_index + note_duration * sampling_rate - 1;
    combined_wave(start_index:end_index) = combined_wave(start_index:end_index) + note_wave;
end

% Normalize the combined wave
combined_wave = combined_wave / max(abs(combined_wave));

% Play the generated sound
%sound(combined_wave, sampling_rate);


%% Melody No Fundamentals

num_harmonics = 10;
% Generate the combined waveform for the melody
combined_wave = zeros(1, note_duration * sampling_rate * length(melody));
for i = 1:length(melody)
    freq = 0;
    if strcmp(melody{i}, 'D')
        freq = D_freq;
    elseif strcmp(melody{i}, 'E')
        freq = E_freq;
    elseif strcmp(melody{i}, 'G')
        freq = G_freq;
    end
    
    % Generate sine wave for the current note with multiple harmonics
    note_wave = zeros(1, note_duration * sampling_rate);
    for h = 2:1:num_harmonics
        t = (0:(note_duration * sampling_rate - 1)) * (1/sampling_rate);
        note_wave = note_wave + sin(2 * pi * freq * h * t);
    end
    
    % Add the current note to the combined waveform
    start_index = (i - 1) * note_duration * sampling_rate + 1;
    end_index = start_index + note_duration * sampling_rate - 1;
    combined_wave(start_index:end_index) = combined_wave(start_index:end_index) + note_wave;
end

% Normalize the combined wave
combined_wave = combined_wave / max(abs(combined_wave));

% Play the generated sound
sound(combined_wave, sampling_rate);

%% Melody with no fundamentals and 1st harmonics

num_harmonics = 10;
% Generate the combined waveform for the melody
combined_wave = zeros(1, note_duration * sampling_rate * length(melody));
for i = 1:length(melody)
    freq = 0;
    if strcmp(melody{i}, 'D')
        freq = D_freq;
    elseif strcmp(melody{i}, 'E')
        freq = E_freq;
    elseif strcmp(melody{i}, 'G')
        freq = G_freq;
    end
    
    % Generate sine wave for the current note with multiple harmonics
    note_wave = zeros(1, note_duration * sampling_rate);
    for h = 3:1:num_harmonics
        t = (0:(note_duration * sampling_rate - 1)) * (1/sampling_rate);
        note_wave = note_wave + sin(2 * pi * freq * h * t);
    end
    
    % Add the current note to the combined waveform
    start_index = (i - 1) * note_duration * sampling_rate + 1;
    end_index = start_index + note_duration * sampling_rate - 1;
    combined_wave(start_index:end_index) = combined_wave(start_index:end_index) + note_wave;
end

% Normalize the combined wave
combined_wave = combined_wave / max(abs(combined_wave));

% Play the generated sound
sound(combined_wave, sampling_rate);



