function [ all_pain_scores,max_score ] = calPainScore_fact( seg_lengths, cu_mins,pain_scale)

 fprintf('\n');
        disp('---------Pain Scores as of the "Min-Scale"---------');

all_pain_scores = [];

for i=1:length(seg_lengths)
    
    disp([num2str(i),'. Cry-Segment: ']); 
 
   if(strcmp(pain_scale,'min-scale'))
      [ pain_scores,max_score ] = min_scale( cu_mins{i} );
    else
      [ pain_scores,max_score ] = length_scale( seg_lengths{i} );  
   end
   all_pain_scores = [all_pain_scores,{pain_scores}] ;
    
    for j=1:length(pain_scores)
        disp(['| ',num2str(i),'.',num2str(j),'. Sub-Segment: Pain-Score = ',num2str(pain_scores(j))]); 
    end
end


end

