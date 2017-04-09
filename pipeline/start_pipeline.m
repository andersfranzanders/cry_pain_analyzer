function start_pipeline( filename, t_s,pain_scale,f_act )

if (~strcmp(pain_scale,'min-scale') && ~strcmp(pain_scale,'length-scale'))
    error('Please enter either "min-scale" or "length-scale" as a pain-scale name!');
end


%Plot Input Signal
[x,Fs,classLabelsOfSamples] = readInAudioAndClassLabels(filename);
time_support = (0:1/Fs:(length(x)-1)/Fs);

figure('Name', filename,'position', [400, 400, 1000, 300])
set(gcf,'color','w');


[xInWindowsSupport,xInWindows,voicedSignalWindows] = detectCrySounds(x,25,Fs,classLabelsOfSamples);
plotSignal( x, time_support, Fs, voicedSignalWindows,xInWindowsSupport);


cryUnits = markCryUnits(xInWindowsSupport, voicedSignalWindows);
[segments] = segment( cryUnits, t_s, Fs);

if nargin  < 4 || f_act == 0   
    [start_ends,seg_lengths, cu_mins] = calculateSegmentFeatures(segments,Fs);
    [ pain_scores,numOfScores ] = calPainScore( seg_lengths, cu_mins,pain_scale );
    [ regionsWithColorData ] = calVizData( start_ends, length(x)/Fs, pain_scores, numOfScores );
    
else
    f_act = 1/f_act;
    [start_ends,seg_lengths, cu_mins] = calculateSegmentFeatures_fact(segments,Fs,f_act);
    [ all_pain_scores,numOfScores ] = calPainScore_fact( seg_lengths, cu_mins,pain_scale);
    [ regionsWithColorData ] = calVizData_fact( start_ends, length(x)/Fs, all_pain_scores, numOfScores );
    
    
end
drawPainScoreBeam( regionsWithColorData,[2,1,2],100,Fs );

end


