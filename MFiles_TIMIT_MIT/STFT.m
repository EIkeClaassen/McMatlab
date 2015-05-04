function [ mSTFT, vFreq] = STFT( mFrames, dFs, vAnalysisWindow )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

NFFT = length(vAnalysisWindow); 

    for i=1:size(mFrames,1);
        mSTFT(:,i)=fft(mFrames(i,:),NFFT);
    
        vFreq= dFs/2*linspace(0,1,NFFT/2+1);
    end
    
mSTFT=(mSTFT(1:NFFT/2+1,:));

