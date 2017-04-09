function [ pain_scores,max_score ] = calPainScore( seg_lengths, cu_mins,pain_scale )


if(strcmp(pain_scale,'min-scale'))
        fprintf('\n');
        disp('---------Pain Scores as of the "Min-Scale"---------');
      [ pain_scores,max_score ] = min_scale( cu_mins );
    else
        fprintf('\n');
        disp('---------Pain Scores as of the "Length-Scale"---------');
      [ pain_scores,max_score ] = length_scale( seg_lengths );  
end

for i=1:length(pain_scores)
    disp([num2str(i),'. Cry-Segment: Pain-Score = ',num2str(pain_scores(i))]); 
end

end

