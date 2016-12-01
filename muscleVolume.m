function [ muscleVolume ] = muscleVolume( area1, area2, area3, area4, area5, area6, distance )
%MUSCLEVOLUME Calculates de volume of a muscle 
%   This function will return as an output the volume of a muscle.
% The inputs are the area of the cross sectional area of images at 6
% different points along the muscle and the distance in cm between those
% images.
% Created by: Ana Gomez. November 26, 2016

muscleVolume =(((area1)/3)+(((area1+area2)/2)*distance)+(((area2+area3)/2)*distance)+(((area3+area4)/2)*distance)+(((area4+area5)/2)*distance)+(((area5+area6)/2)*distance)+((area6)/3));
end

