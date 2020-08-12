function [x, y, z] = findCartesian(az, el, pos_observer, pos_launcher)
% [x, y, z] = findCartesian(az, el, pos_observer, pos_launcher)
% Written By: Csaba Nemeth
% Version: 1.2 Since 2020-03-03
%
% Takes a 2D array of azimuth data observations for two locations, and a 2D
% array of elevation observations for both locatations. These two locations
% are defined by pos_observer and pos_launcher respectively. These are
% arrays in cartesian coordinates of (x, y).

    %Import observer and azimuth data.
    az_observer = az(:,1);
    az_launcher = az(:,2);
    el_observer = el(:,1);

    %Find the slopes of the observer and launcher data points.
    m_observer = tan(az_observer);
    m_launcher = tan(az_launcher);

    %Find the intercept of the slopes in the x,y plane.
    b_observer = pos_observer(2) - m_observer .* pos_observer(1);
    b_launcher = pos_launcher(2) - m_launcher .* pos_launcher(1);

    %Find the intersection of lines in cartesian coordinates.
    x = (b_observer - b_launcher)./(m_launcher - m_observer);
    y = m_observer .* x + b_observer;

    %Find the z locations
    rxy_observer = sqrt((x - pos_observer(1)).^2 + (y - pos_observer(2)).^2);
    z = tan(el_observer).*rxy_observer;
    
end %End Function findCartesian(az, el, pos_observer, pos_launcher)

