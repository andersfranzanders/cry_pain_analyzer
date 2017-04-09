function [support,xInWindows,voicedWindows,realCs] = detectCrySounds( x, windowLengthInMs,Fs,classSignal)

%cut input signal into windows
xInWindows = cutSignalIntoWindows(x,windowLengthInMs,Fs);
xInWindows = xInWindows(1:end-1,:);

%calculate cepstrum of every window
specto = calSpectogram(xInWindows, 2^11);
ceptogram = calCeptogram(specto);

% calculate Features

[cepstrumDomPeakFeat]  = calCepstralFeatures(ceptogram,Fs,200,2000);
ceps_diff_feature = calDiffFeature(cepstrumDomPeakFeat,5,windowLengthInMs);

% threshold Feature and Decide
voiced_unvoiced_classification = decideVoiceActivity(ceps_diff_feature);
voicedWindows = decisionSmoothing(voiced_unvoiced_classification);



realCs = calculateRealClassesForWindows(xInWindows, classSignal);

%calculate support vector for output signal of voice-detection-signals
[rows,cols] = size(xInWindows);
lengthOfOriginalSignal = rows*cols/2;
support = 1:(cols/2):lengthOfOriginalSignal;

end

