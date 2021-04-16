% hermannGrid.m
% written on April 3, 2021
% by Shirley Dong
% This script contains the function hermannGrid that creates colored Hermann grids.

% If you run this script it will raise an error, but you can ignore that
% and create grids in the command window.


function [grid] = hermannGrid(r_border,g_border,b_border,r_square,g_square,b_square)
% creates hermann grids 
% first three inputs = rgb values for the color of the bars
% last three inputs = rgb values for the color of the squares
    % create row for grid
    row = [zeros(1,1,3) ones(1,10,3) zeros(1,1,3)];
    % imshow(row);

    % create column for grid
    col = imrotate(row,270);
    % imshow(col);

        % create black and white grid
    bw_grid = repmat([col.*row],6,6);
    % imshow(bw_grid);

    [M,N,D] = size(bw_grid);
    % get dimensions of grid

    grid = bw_grid;

    for ii = 1:M
    % loop through rows of grid
        for jj = 1:N
        % loop through columns of grid
            rgb = reshape(grid(ii,jj,:),3,1);
            % get RGB values at grid location ii,jj
            if rgb == zeros(3,1)
            % check if RGB values at ii,jj are 0s
                grid(ii,jj,:) = cat(3,r_border,g_border,b_border);
                % change border color
            end
            if rgb == ones(3,1)
            % check if RGB values at ii,jj are 1s
                grid(ii,jj,:) = cat(3,r_square,g_square,b_square);
                % change square color
            end
        end
    end
end