clear;
clc;
close all;

% Step 1: Load the audio file
audio_path = '/Users/banalavishwatejareddy/Downloads/Assignment 2&3/data/02.wav';
x = miraudio(audio_path);

%% 

% Extract chromagram
chroma = mirchromagram(x, 'Frame',0.2,0.05);

% Convert chroma to MATLAB matrix
chroma_data = mirgetdata(chroma);

% Plot chromagram
figure;
imagesc(chroma_data);
xlabel('Frame');
ylabel('Chroma');
title('Chromagram');
colorbar;



% Compute the similarity matrix
similarity_matrix = mirsimatrix(chroma_data);

% Convert similarity matrix to MATLAB matrix
similarity_data = mirgetdata(similarity_matrix);

% Plot the similarity matrix
figure;
imagesc(similarity_data);
xlabel('Frame');
ylabel('Frame');
title('Similarity Matrix');
colorbar;

%% 

% Extract chromagram
chroma = mirmfcc(x, 'Frame');

% Convert chroma to MATLAB matrix
chroma_data = mirgetdata(chroma);

% Plot chromagram
figure;
imagesc(chroma_data);
xlabel('Frame');
ylabel('Chroma');
title('mfcc');
colorbar;



% Compute the similarity matrix
similarity_matrix = mirsimatrix(chroma_data);

% Convert similarity matrix to MATLAB matrix
similarity_data = mirgetdata(similarity_matrix);

% Plot the similarity matrix
figure;
imagesc(similarity_data);
xlabel('Frame');
ylabel('Frame');
title('Similarity Matrix');
colorbar;

%%

% Extract chromagram
chroma = mirspectrum(x, 'Frame');

% Convert chroma to MATLAB matrix
chroma_data = mirgetdata(chroma);

% Plot chromagram
figure;
imagesc(chroma_data);
xlabel('Frame');
ylabel('Chroma');
title('spectrum');
colorbar;



% Compute the similarity matrix
similarity_matrix = mirsimatrix(chroma_data);

% Convert similarity matrix to MATLAB matrix
similarity_data = mirgetdata(similarity_matrix);

% Plot the similarity matrix
figure;
imagesc(similarity_data);
xlabel('Frame');
ylabel('Frame');
title('Similarity Matrix');
colorbar;