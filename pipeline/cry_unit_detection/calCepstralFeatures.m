function [ mostDomPeak] = calCepstralFeatures(ceptogram,Fs, lowerHz, upperHz )

[rows,cols] = size(ceptogram);
mostDomPeak = zeros(1,rows);
lowerBound = floor((1/upperHz)*Fs);
upperBound = floor((1/lowerHz)*Fs);

for i = 1:rows
   cepstrum = ceptogram(i,:);
   truncedCeps = cepstrum(lowerBound:upperBound);
   [pks,locs,w,p] = findpeaks(truncedCeps);
 
   [maximumP] = max(p);
   if isempty(p)
       maximumP = 0;
   end
   
   mostDomPeak(i) = maximumP;
  
   
end

end

