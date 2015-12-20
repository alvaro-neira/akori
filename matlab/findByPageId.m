function [page_id1,url1,picture1, coordinates_file1]=findByPageId(id)
	[page_id,url,picture, coordinates_file]=importIds('pages.csv');
	page_id1=id;
	url1='';
	picture1='';
    coordinates_file1='';
	for i=1:length(page_id)
       	if strcmp(id,page_id(i))
			url1=url(i);
			picture1=picture(i);
            coordinates_file1=coordinates_file(i);
			break;
		end
    end
    if(strcmp(coordinates_file1,''))
        error('coordinates file not found');
    end
end
