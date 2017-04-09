function [  all_start_ends, all_seg_lengths, all_cu_mins ] = calculateSegmentFeatures_fact( segments,Fs,f_act )

disp('---------Features of Segments---------');

 all_start_ends = []; 
 all_seg_lengths = [];  
 all_cu_mins = []; 


for i= 1:length(segments)
   cs = segments{i};

   disp([num2str(i),'. Cry-Segment:']);
   fprintf('| Starts at: %.2f s, ends at: %.2f s \n',cs(1,1)/Fs,cs(end,end)/Fs);
   
   subsegments = calSubSegments(cs,Fs,f_act);
   [start_ends,seg_lengths, cu_mins] = calculateSegmentFeatures(subsegments,Fs,i);
   
   all_start_ends = [all_start_ends,{start_ends}]; 
   all_seg_lengths = [all_seg_lengths,{seg_lengths}];  
   all_cu_mins = [all_cu_mins,{cu_mins}]; 
    
end


end

