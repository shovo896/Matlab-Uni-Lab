function stats=myStats(data,varargin)
    ops =varargin;
    stats=struct();
    for i = 1:length(ops)
        switch lower(ops{i})
            case 'mean'
                stats.mean=mean(data);
            case 'std'
                stats.std=std(data);
            case 'min'
                stats.min=min(data);
            case 'max'
                stats.max=max(data);
        end
    end 
end 
