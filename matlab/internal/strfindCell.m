function firstIndex = strfindCell(strCell, string)

    firstIndex = -1;

    for i = 1:length(strCell)
       if strcmp(strCell{i},string)
          firstIndex = i;
          break;
       end
    end

end