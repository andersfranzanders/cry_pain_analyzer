%%% This is an implementation for the master thesis "Visualisierung 
%%% kontinuierlicher, multimodaler Schmerz-Scores am Beispiel akustischer 
%%% Signale" written by Franz Anders for the "Laboratory for Biosignal
%%% Processing", Leipzig. 

%%% Parameters
% filename:     The audio-file you want to analyze. You can use either file
%               provided in the "Beispielsignale"-Folder
% t_s:          The segmentation-parameter in [seconds]. For example, t_s =
%               5 means that all cry-units with a pause of < 5 s in between
%               each other get put into one segment. For further details,
%               see section 5.1 in the master thesis
% pain-scale:   You can choose between two example pain-scales for the 
%               pain-assessment. The "min-scale" and the "length-scale" are
%               explained in section 6.1 in the master thesis
%f_act:         Usage of a actualization-frequency, as explained in
%               sub-section 5.2.2 in the master thesis. A frecency of 1/10
%               means that every 10 seconds the pain-score for an
%               cry-segment is updated.
%
% You can either pass or not pass an actualization-frequency to the
% algorithm. If you don't, the visualisation works as explained in section
% 6.1 and shown in 6.2 of the thesis (which means that one pain-score is
% calculated for each cry-segment). If you pass an actualization-frequency,
% the visualisation works as explained in section 6.3. Using the 
% "Oldest-on-Top"-Method, putting each pain-score calucated for an newer 
% underneath an older region .



%%% enter path audiofile you want to analyze ...
filename = '../Beispielsignale/exampleSignalFromSection6OfThesis.wav';

%%% enter segmentation time in seconds ...
t_s = 10;

%%% enter name of pain-scale ...
pain_scale = 'length-scale';
%pain_scale = 'min-scale';

%%% and start!
start_pipeline( filename, t_s, pain_scale);


%%% Use this if you want to use an actualization-frequency.
%f_act = 1/20;
%start_pipeline( filename, t_s, pain_scale,f_act);

