function [ viz_data ] = calVizData_fact( all_start_ends, endTime, all_pain_scores, numOfScores )

numOfSegs  = length(all_start_ends);

pauseGreen = color_scheme(0,numOfScores);
region_start = 0;
viz_data =[]; 

for i = 1:numOfSegs
    currentSeg = all_start_ends{i};
    region_end = currentSeg(1,1);
    viz_entry = [region_start; region_end; pauseGreen];
    viz_data = [viz_data, viz_entry];
    
    region_start = currentSeg(end,end);
    
end

viz_entry = [region_start; endTime; pauseGreen];
viz_data = [viz_data, viz_entry];

for currentSegNum =1:numOfSegs
    
    start_ends = all_start_ends{currentSegNum};
    pain_scores = all_pain_scores{currentSegNum};
    [rows,cols] = size(start_ends);
    region_start = 0;
    for i = 1:cols
        if i == 1
           region_start = start_ends(1,i);
        else
           region_start = start_ends(2,i-1);
        end
        region_end = start_ends(2,i);
        current_score = pain_scores(i);
       
        color = color_scheme(current_score,numOfScores);
        viz_entry = [region_start; region_end; color];
        viz_data = [viz_data, viz_entry];
    end
end

end

