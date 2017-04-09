function [ start_ends, length_all, cu_mins] = calculateSegmentFeatures( segments,Fs )

numSegments = length(segments);

length_all = [];
density = [];
cu_stats = [];
tempo = [];
start_ends = [];

 disp('---------Features of Segments---------');

for i = 1:numSegments
    
    cs = segments{i};
    
    cs_start_end = [cs(1,1)/Fs; cs(end,end)/Fs];
    start_ends = [start_ends,cs_start_end];
    
    cs_length = (cs(end,2) - cs(1,1)) / Fs;
    length_all = [length_all,cs_length];
    
    cs_density = sum(cs(:,2) - cs(:,1))/(Fs*cs_length);
    density = [density, cs_density];
    
    cs_cu_lengths = (cs(:,2) - cs(:,1))./Fs;
    cs_cu_stats = [ mean(cs_cu_lengths);  median(cs_cu_lengths) ...
        ;max(cs_cu_lengths); min(cs_cu_lengths); std(cs_cu_lengths) ];
    cu_stats = [cu_stats, cs_cu_stats];
    
    cs_tempo = length(cs_cu_lengths)/cs_length;
    tempo = [tempo,cs_tempo];
    
    disp([num2str(i),'. Segment:']);
    fprintf('| Starts at: %.2f s, ends at: %.2f s \n',cs_start_end(1),cs_start_end(2));
    fprintf('| Length: %.2f s \n',cs_length);
    fprintf('| Density: %.2f \n',cs_density);
    fprintf('| Tempo: %.2f Cry-Units/s \n',cs_tempo);
    fprintf('| Statistics of lenghts of Cry-Units: mean =  %.2f s, min = %.2f s, max = %.2f s \n',cs_cu_stats(1),cs_cu_stats(4),cs_cu_stats(3));
    
  
end

cu_mins = cu_stats(4,:);

end

