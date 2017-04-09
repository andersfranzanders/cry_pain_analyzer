function [ viz_data ] = calVizData( start_ends, endTime, pain_scores, num_of_scores )

pauseGreen = color_scheme(0,num_of_scores);

region_start = 0;
viz_data =[]; 
[rows,cols] = size(start_ends);

for i = 1:cols
    region_end = start_ends(1,i);
    
    viz_entry = [region_start; region_end; pauseGreen];
    viz_data = [viz_data, viz_entry];
    
    region_start = start_ends(2,i);
    
end

viz_entry = [region_start; endTime; pauseGreen];
viz_data = [viz_data, viz_entry];

for i = 1:cols
    region_start = start_ends(1,i);
    region_end = start_ends(2,i);
    current_score = pain_scores(i);
    %score_n = 1 - current_score/max_score;
    
    %[r,g,b] = hsv2rgb(score_n*120/360,0.8,1);
    color = color_scheme(current_score,num_of_scores);
    viz_entry = [region_start; region_end; color];
    viz_data = [viz_data, viz_entry];
end


end

