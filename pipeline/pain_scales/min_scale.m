function [ pain_scores,num_of_scores ] = min_scale( cu_mins )


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
    
end    


end

