function [ ] = loadVLFeat()
%loadVLFeat loads the VLFeat package

if isunix
    run('./vlfeat/toolbox/vl_setup');
else
    run('vlfeat\toolbox\vl_setup');
end

    vl_version verbose

end

