function [ pain_scores,num_of_scores ] = min_scale( cu_mins )

fprintf('\n');
disp('---------Pain Scores as of the "Min-Scale"---------');



num_of_scores = 4;
pain_scores = zeros(1,length(cu_mins));
for i =1:length(cu_mins)
    score = 0;
    
    if cu_mins(i) >= 0.3
        score = 1;
    end
    
    if cu_mins(i) >= 1.1
        score = 2;
    end
    
    if cu_mins(i) > 2
        score = 3;
    end
    pain_scores(i) = score;
    
    disp([num2str(i),'. Segment: Pain-Score = ',num2str(score)]);
end    


end

