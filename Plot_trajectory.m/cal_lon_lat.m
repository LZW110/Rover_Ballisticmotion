function [lon,lat]=cal_lon_lat(p)

    if(p(2)>=0)
        lon=acosd(p(1)/sqrt(p(1)^2+p(2)^2));
    else
        lon=360-acosd(p(1)/sqrt(p(1)^2+p(2)^2));
    end
    lat=atand(p(3)/sqrt(p(1)^2+p(2)^2));
    
end