function [ voiced_unvoiced ] = decideVoiceActivity( feature )

numWindows = length(feature);
voiced_unvoiced = zeros(1,numWindows);

for i =1:numWindows
     
    if feature(i) < 0.02
        voiced_unvoiced(i) =  0; 
    else
        voiced_unvoiced(i) =  1;
    end
end



end

