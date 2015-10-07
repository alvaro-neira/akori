function [page_id1,url1,picture1]=findByPageId(id)
	[page_id,url,picture]=importIds('pages.csv');
	page_id1=id;
	url1='';
	picture1='';
	for i=1:length(page_id)
       	if strcmp(id,page_id(i))
			url1=url(i);
			picture1=picture(i);
			break;
		end
	end

end
