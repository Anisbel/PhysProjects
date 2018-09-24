function [MatRot] = Rotation(theta, mat)
%ROTATION Summary of this function goes here
%   Detailed explanation goes here

    rot = [cos(theta), 0, sin(theta); 0, 1, 0; -sin(theta), 0, cos(theta)];
    MatRot = transpose(rot * transpose(mat));
end

