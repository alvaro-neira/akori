function [ output_args ] = plotimg( imgspath, maxx, maxy, picturename, yoffset,gx, gy )
    if ~isvector(gx)
        error('Argument 6 be a vector')
    end
    if ~isvector(gy)
        error('Argument 7 be a vector')
    end
    figure('units','normalized','outerposition',[0 0 1 1])
    img=imread(char(strcat(imgspath,picturename)));
    
    [height, width, dim] = size(img);
    cutimage=img(1:maxy,:,:);
    image([0 maxx],[yoffset maxy],cutimage);
    hold on;
    plot(gx,gy,'o');
    ylim([yoffset maxy]);
    xlim([0 maxx]);
    h = zoom;
    set(h,'Motion','vertical','Enable','on');
%     gx
%     xlswrite('tuhermana.csv',gx);
end

