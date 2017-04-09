function [ diffFeature ] = calDiffFeature( feature, minWindowTime, originalWindowLengthInMs )


windows = length(feature);
diffFeature = zeros(1,length(feature));
numOfWindows = (2*minWindowTime/(0.001*originalWindowLengthInMs) ) - 1;

for i = 1:windows
    backPos = i - numOfWindows;
    if (backPos<1)
        backPos = 1;
    end
    
    if i ~=1
        minValue = min(feature(backPos:i));
    else 
        minValue = feature(i);
    end
    diffFeature(i) = feature(i) - minValue;

end


end

