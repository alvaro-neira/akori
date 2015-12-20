function plotEventInSignal(timeSignal,signal,eventStruct)

    plot(timeSignal,signal);
    
    hold on
    
    for i = 1:length(eventStruct.startTimes)
       foundIndex = find(timeSignal<=eventStruct.startTimes(i),1,'last');
       
       if ~isempty(foundIndex)
          plot(timeSignal(foundIndex),signal(foundIndex),'o'); 
       end
    end
    
    for i = 1:length(eventStruct.endTimes)
       foundIndex = find(timeSignal>=eventStruct.endTimes(i),1,'first');
       
       if ~isempty(foundIndex)
          plot(timeSignal(foundIndex),signal(foundIndex),'*'); 
       end
    end

end