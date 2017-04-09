function [ cryUnits ] = markCryUnits( support, Cs)

cryUnits = [];

dCs = diff(Cs);
dCs = [0, dCs];

startpoint = 0;
for i = 1:length(dCs)
   if dCs(i) == 1
        startpoint = support(i);
   end
   if dCs(i) == -1
       endpoint = support(i);
       cryUnits = [cryUnits;startpoint, endpoint ];
       startpoint = 0;
   end
       
end

if startpoint ~= 0 
   endpoint = support(i);
   cryUnits = [cryUnits;startpoint, endpoint ];
end



fprintf('\n');
message = '================== Results of Analysis ==================';
fprintf('\n');
disp(message);
[rows,cols] = size(cryUnits);
message = ['Number of Detected Cry-Units in this Signal: ' ,  num2str(rows)];
disp(message);
end

