%page tag is [pageNumber scrollNumber]
function id = askWebDatabase(x,y,page)

    %load database: contains a cell(page number) of cells(scroll numbers) 
    %with matrixes listing objects id's and x,y positions of first and 
    %end corners (Nx5 matrix)
    load('../../resources/webDatabase.mat')
    id = 0;
    
    %pagObjects comes from webDatabase.mat
    currentPage = pageObjects{page(1)};
    currentScroll = currentPage{page(2)};
    
    %Nx5 matrix: |id|x1|y1|x2|y2|
    myObjects = currentScroll.objects;
    mySizes = size(myObjects);
    
    i = 1;
    while ~id  && i <= mySizes(1)
        %inside object ?
        if x > myObjects(i,2) && x < myObjects(i,4) && y > myObjects(i,3) && y < myObjects(i,5)
            id = i;
        else
            i = i+1;
        end
    end

end