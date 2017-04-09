function [ viz_data ] = calVizData( start_ends, endTime, pain_scores, num_of_scores )

pauseGreen = getDescreteColorForScore(0,num_of_scores);

current_start = 0;
viz_data =[]; 
[rows,cols] = size(start_ends);

for i = 1:cols
    current_end = start_ends(1,i);
    
    viz_entry = [current_start; current_end; pauseGreen];
    viz_data = [viz_data, viz_entry];
    
    current_start = start_ends(2,i);
    
end

viz_entry = [current_start; endTime; pauseGreen];
viz_data = [viz_data, viz_entry];

for i = 1:cols
    current_start = start_ends(1,i);
    current_end = start_ends(2,i);
    current_score = pain_scores(i);
    %score_n = 1 - current_score/max_score;
    
    %[r,g,b] = hsv2rgb(score_n*120/360,0.8,1);
    color = getDescreteColorForScore(current_score,num_of_scores);
    viz_entry = [current_start; current_end; color];
    viz_data = [viz_data, viz_entry];
end


end

