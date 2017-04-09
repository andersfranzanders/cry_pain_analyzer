function [ segments] = segment( cryUnits, t_s, Fs)

segments = [];
thisSeg = cryUnits(1,:);
[rows,cols] = size(cryUnits);
for j = 2:rows
    cu_i_end = cryUnits(j-1,2);
    cu_j_start = cryUnits(j,1);
    d = (cu_j_start - cu_i_end)/Fs;
    
    if d < t_s
       thisSeg = [thisSeg; cryUnits(j,:)];
    else
       segments = [segments, {thisSeg}];
       thisSeg = cryUnits(j,:);
    end
end

segments = [segments, {thisSeg}];


disp(['Number of found Cry-Segments (with t_s = ', num2str(t_s),'): ' num2str(length(segments))]);
fprintf('\n');

end

