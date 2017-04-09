function [ pain_scores,num_of_scores ] = length_scale( seg_lengths )

fprintf('\n');
disp('---------Pain Scores as of the "Length-Scale"---------');

num_of_scores = 3;
pain_scores = zeros(1,length(seg_lengths));
for i =1:length(seg_lengths)
    
    if seg_lengths(i) < 60
        score = 1;
    else 
        score = 2;
    end
    pain_scores(i) = score;
    
    disp([num2str(i),'. Segment: Pain-Score = ',num2str(score)]);
end    


end

