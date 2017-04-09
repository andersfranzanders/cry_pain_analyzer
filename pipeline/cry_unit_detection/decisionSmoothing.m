function v_nv_classification = decisionSmoothing(v_nv_classification)


alpha_min = 4;
d_min = 4;


erasedElement = 0;
nextSilenceStart = 0;
for i = 2:length(v_nv_classification)
    
    if v_nv_classification(i-1) == 0 && v_nv_classification(i) == 1
       
       silenceEnd = i;
       if erasedElement == 0
            thisSilenceStart = nextSilenceStart;  
       end
       
       voicedSegmentStart = i;
       erasedElement = 0;
    end
    
    if v_nv_classification(i-1) == 1 && v_nv_classification(i) == 0
       voicedSegmentEnd = i;
        nextSilenceStart = i;
       if (voicedSegmentEnd - voicedSegmentStart) < alpha_min
           if (silenceEnd - thisSilenceStart) > d_min
               v_nv_classification(voicedSegmentStart:voicedSegmentEnd) = 0;
               erasedElement = 1;
           else
                v_nv_classification(thisSilenceStart:silenceEnd) = 1;
           end
           
       end
    end
  
end

silenceStart = 1;
for i = 2:length(v_nv_classification)
    if v_nv_classification(i-1) == 1 && v_nv_classification(i) == 0
        silenceStart = i;
    end
    
    if v_nv_classification(i-1) == 0 && v_nv_classification(i) == 1
        silenceEnd = i;
        if silenceEnd - silenceStart <= d_min
            v_nv_classification(silenceStart:silenceEnd) = 1;
        end
    end
end

end

