clear;
clc;
close all;

% Load the audio file
audio_path = '/Users/banalavishwatejareddy/Downloads/Assignment 2&3/data/02.wav';
x = miraudio(audio_path);

% Define parameters
features = {'chroma', 'mfcc', 'spectrum'};
frame_lengths = [0.2, 0.4,0.6];  % Try different frame lengths
hop_factors = [0.25, 0.5, 0.75];  % Try different hop factors

% Plot similarity matrix for different parameters
for feat = 1:length(features)
    for fl = 1:length(frame_lengths)
        for hf = 1:length(hop_factors)
            % Extract features
            if strcmp(features{feat}, 'chroma')
                feature = mirchromagram(x, 'Frame', frame_lengths(fl));
            elseif strcmp(features{feat}, 'mfcc')
                feature = mirmfcc(x, 'Frame', frame_lengths(fl));
            elseif strcmp(features{feat}, 'spectrum')
                feature = mirspectrum(x, 'Frame', frame_lengths(fl));
            end
            
            chroma_data = mirgetdata(feature);
            % Compute the similarity matrix
            similarity_matrix = mirsimatrix(chroma_data);
            
            % Convert similarity matrix to MATLAB matrix
            similarity_data = mirgetdata(similarity_matrix);
            
            % Plot the similarity matrix
            figure;
            imagesc(similarity_data);
            xlabel('Frame');
            ylabel('Frame');
            title(['Similarity Matrix - Feature: ', features{feat}, ', Frame Length: ', num2str(frame_lengths(fl))]);
            colorbar;
        end
    end
end
