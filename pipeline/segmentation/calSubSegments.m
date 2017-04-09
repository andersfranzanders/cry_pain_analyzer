function [ all_subsegments ] = calSubSegments( cs,Fs,f_act )

all_subsegments = [];
[rows,cols] = size(cs);

currentStart = cs(1,1)/Fs;
currentEnd = currentStart + f_act;
lastKnownEnd = 0;

endOfSegment = cs(end,end)/Fs;

while currentEnd <= endOfSegment+Fs
    subseg = [];
    for i = 1:rows  
        if cs(i,2)/Fs < currentEnd
            subseg = [subseg; cs(i,1), cs(i,2)];
        end
    end
    if ~isempty(subseg) && subseg(end,end)>lastKnownEnd
        all_subsegments = [all_subsegments, {subseg}];
        lastKnownEnd = subseg(end,end);
    end
    currentEnd = currentEnd + f_act;
end




end

