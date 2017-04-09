function start_pipeline( filename, t_s,pain_scale )

if (~strcmp(pain_scale,'min-scale') && ~strcmp(pain_scale,'length-scale'))
    error('Please enter either "min-scale" or "length-scale" as a pain-scale name!');
end


%Plot Input Signal
[x,Fs,classLabelsOfSamples] = readInAudioAndClassLabels(filename);
time_support = (0:1/Fs:(length(x)-1)/Fs);

figure('Name', filename,'position', [400, 400, 1000, 300])
set(gcf,'color','w');

[xInWindowsSupport,xInWindows,voicedSignalWindows] = detectCrySounds(x,25,Fs,classLabelsOfSamples);

cryUnits = markCryUnits(xInWindowsSupport, voicedSignalWindows);

[segments] = segment( cryUnits, t_s, Fs);

[start_ends,seg_lengths, cu_mins] = calculateSegmentFeatures(segments,Fs);

if(strcmp(pain_scale,'min-scale'))
  [ pain_scores,max_score ] = min_scale( cu_mins );
else
  [ pain_scores,max_score ] = length_scale( seg_lengths );  
end

[ viz_data ] = calVizData( start_ends, length(x)/Fs, pain_scores, max_score );

drawPainScoreLine( viz_data,[2,1,2],100,Fs );
    
    
    %[ pain_scores,max_score ] = regressor_min_master( cu_stats(4,:) );
    %[ viz_data ] = pipeline_calVizData( start_ends, length(x)/Fs, pain_scores, max_score );
    %drawPainScoreLine( viz_data,[3,1,3],75,Fs );
    
    
%     hold on;
%     subplot(3,1,1);    
%     plot(t,x,'Color',[0.5,0.5,0.5]);
%     axis([0 length(x)/Fs -1 1]);
%     


plotSignal( x, time_support, Fs, voicedSignalWindows,xInWindowsSupport);

