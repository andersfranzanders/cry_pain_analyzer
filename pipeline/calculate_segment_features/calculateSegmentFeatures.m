function [ start_ends, length_all, cu_mins] = calculateSegmentFeatures( segments,Fs,parentSegment )

numSegments = length(segments);

length_all = [];
cu_stats = [];
start_ends = [];

if nargin < 3 
 disp('---------Features of Segments---------');
end
 
 
for i = 1:numSegments
    
    cs = segments{i};
    
    cs_start_end = [cs(1,1)/Fs; cs(end,end)/Fs];
    start_ends = [start_ends,cs_start_end];
    
    cs_length = (cs(end,2) - cs(1,1)) / Fs;
    length_all = [length_all,cs_length];
    
    cs_density = sum(cs(:,2) - cs(:,1))/(Fs*cs_length);
   
    
    cs_cu_lengths = (cs(:,2) - cs(:,1))./Fs;
    cs_cu_stats = [ mean(cs_cu_lengths);  median(cs_cu_lengths) ...
        ;max(cs_cu_lengths); min(cs_cu_lengths); std(cs_cu_lengths) ];
    cu_stats = [cu_stats, cs_cu_stats];
    
    if length(cs_cu_lengths) > 1
        cs_pause_lengths = (cs((2:end),1) - cs((1:end-1),2))./Fs;
        cs_pause_stats = [ mean(cs_pause_lengths);  median(cs_pause_lengths) ...
            ;max(cs_pause_lengths); min(cs_pause_lengths); std(cs_pause_lengths) ];
    end
    
    cs_tempo = length(cs_cu_lengths)/cs_length;
    
    lines = '| ';
    if nargin < 3 
        disp([num2str(i),'. Cry-Segment:']);
    else
        disp(['| ',num2str(parentSegment),'.',num2str(i),'. Sub-Segment:']);
        lines = '| | ';
    end
        
        disp([lines,sprintf('Starts at: %.2f s, ends at: %.2f s',cs_start_end(1),cs_start_end(2))]);
        disp([lines,sprintf('Length: %.2f s',cs_length)]);
        disp([lines,sprintf('Density: %.2f',cs_density)]);
        disp([lines,sprintf('Tempo: %.2f Cry-Units/s',cs_tempo)]);
        disp([lines,sprintf('Statistics of lenghts of Cry-Units: mean =  %.2f s, min = %.2f s, max = %.2f s',cs_cu_stats(1),cs_cu_stats(4),cs_cu_stats(3))]);
        
        if length(cs_cu_lengths) > 1
            disp([lines,sprintf('Statistics of lenghts of Pauses: mean =  %.2f s, min = %.2f s, max = %.2f s',cs_pause_stats(1),cs_pause_stats(4),cs_pause_stats(3))]);
        end
  
end

cu_mins = cu_stats(4,:);

end

