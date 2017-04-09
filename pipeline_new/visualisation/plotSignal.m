function plotSignal( x, time_support, Fs, voicedSignalWindows,support  )

hold on;
subplot(2,1,1);    
plot(time_support,x,'Color',[0.5,0.5,0.5]);
axis([0 length(x)/Fs -1 1]);

new_x = convertToBlackX(x,voicedSignalWindows,support);
subplot(2,1,1); 
hold on;
plot(time_support,new_x,'k');
axis([0 length(x)/Fs -1 1]);

end

