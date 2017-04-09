% enter path audiofile you want to analyze
%filename = '../audiobase/temptestbase/cry_clean06_corridor_3db.wav';
filename = '../audiobase/temptestbase/TimeAnalysis_testSignal_masterCase02_20dbSNR_barcelona.wav';

% enter segmentation time in seoncds!
t_s = 10;

% enter name of pain-scale
%pain_scale = 'min-scale';
pain_scale = 'min-scale';

%and start!
start_pipeline( filename, t_s, pain_scale );

