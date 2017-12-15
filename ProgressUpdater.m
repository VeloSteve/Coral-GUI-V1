function [ ] = ProgressUpdater( dir, ax, nw, v )
    % Update the progress bars for the parallel workers.
    vals = zeros(1, nw);
    x = zeros(1, nw);
    for i = 1:nw
        x(i) = i;
        fn = fullfile(dir, strcat('/Prog_', num2str(i)));
        if nargin == 4
            vals(i) = v;
            if v == 0
                    pf = fopen(fn, 'w');
                    fprintf(pf, '%d', 0);
                    fclose(pf);
            end
        else
            data = csvread(fn);
            vals(i) = data;
        end
    end
    %fprintf('nargin = %d, nw = %d, vals(1) = %d\n', nargin, nw, vals(1));
    bar(ax, x, vals);
    % ticks change and need to be reset here!
    ax.XTick = 0:nw+1;

    pause(0.1);

end

