%Project: Muscle volume calculator
%Name: Ana Gomez
%Due: December 1
%This code will take 6 images of a muscle's cross sectional area imputed by
%the user and will allow the user to determine the area of interest (cross
%sectional area) and then input the distance in cm between the images. With
%this information the code will determine the muscle's volume.
%This code has been tested in MATLAB R2016a
clear all
close all
clc
fprintf(['This code will help you determine a muscle''s volume.\n\n', ...
    'NOTE: images can''t be panoramic and have to be at 105 percent zoom.\n' ,...
    'The musle of interest will be divided in 5 areas of the same size leaving 1 cm in each end, and cross sectional\n' ,...
    'images will be taken in the edges of each area, giving us a total of 6 images along the muscle. The images should\n' ,...
    'be inputed in order from the most distal part of the muscle to proximal.\n', ...
    '\nYou will have to input the name of the files containing your images between '''', for example: ''image1.jpg''\n'])
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% User's inputs %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i=1:6
        fprintf('Input the name of the file of image #%d:\n',i);
        imageName{i,1}=input('');
    end
distance = input('\nInput ths distance in cm between the images:\n');
%%
%%%%%%%%%%%%%%%%%%% Read images depending on the type %%%%%%%%%%%%%%%%%%%%%
fprintf ('\nWhat type of file are your images?\n\nDICOM = 1\nOther type = 2\n')
type = input('');
    while type ~= 1 && type ~= 2
        type = input('Please enter a valid number (1 or 2): ');
    end
    if type == 1
        image1 = dicomread(imageName{1,1});
        image2 = dicomread(imageName{2,1});
        image3 = dicomread(imageName{3,1});
        image4 = dicomread(imageName{4,1});
        image5 = dicomread(imageName{5,1});
        image6 = dicomread(imageName{6,1});
    else
        image1 = imread(imageName{1,1});
        image2 = imread(imageName{2,1});
        image3 = imread(imageName{3,1});
        image4 = imread(imageName{4,1});
        image5 = imread(imageName{5,1});
        image6 = imread(imageName{6,1});
    end
%%
%%%%%%%%%%%%%%%%%%%% Region of interest selection %%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(['Images are going to show one at a time and you will select the region of interest.\n' ,...
    'When the image shows you just have to select the point where you want to start, click, \n' ,...
    'hold while you select the area, and let go when you get back to the starting point.\n' ,...
    'After you select the region of interest determine if you want to keep that region, or \n' ,...
    'if you want to select it again.\n'])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMAGE 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
roi1Again = 1;
    while roi1Again == 1
        image(image1)
        h1 = imfreehand;
        fprintf(['\n\nWhat do you want to do with this image?\nSelect a new region of interest = 1\n' ,...
            'Keep the region selected = 2\n'])
        roi1Again = input('');
            while roi1Again ~= 1 && roi1Again ~= 2
                roi1Again = input('Please enter a valid number (1 or 2): ');
            end
    end
clc
BW1 = createMask(h1);
numPixels = sum(BW1(:));
area1 = numPixels * 0.000054832561;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMAGE 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
roi2Again = 1;
    while roi2Again == 1
        image(image2)
        h2 = imfreehand;
        fprintf(['What do you want to do with this image?\nSelect a new region of interest = 1\n' ,...
            'Keep the region selected = 2\n'])
        roi2Again = input('');
            while roi2Again ~= 1 && roi2Again ~= 2
                roi2Again = input('Please enter a valid number (1 or 2): ');
            end
    end
clc
BW2= createMask(h2);
numPixels = sum(BW2(:));
area2 = numPixels * 0.000054832561;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMAGE 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
roi3Again = 1;
    while roi3Again == 1
        image(image3)
        h3 = imfreehand;
        fprintf(['What do you want to do with this image?\nSelect a new region of interest = 1\n' ,...
            'Keep the region selected = 2\n'])
        roi3Again = input('');
            while roi3Again ~= 1 && roi3Again ~= 2
                roi3Again = input('Please enter a valid number (1 or 2): ');
            end
    end
clc
BW3 = createMask(h3);
numPixels = sum(BW3(:));
area3 = numPixels * 0.000054832561;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMAGE 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
roi4Again = 1;
    while roi4Again == 1
        image(image4)
        h4 = imfreehand;
        fprintf(['What do you want to do with this image?\nSelect a new region of interest = 1\n' ,...
            'Keep the region selected = 2\n'])
        roi4Again = input('');
            while roi4Again ~= 1 && roi4Again ~= 2
                roi4Again = input('Please enter a valid number (1 or 2): ');
            end
    end
clc
BW4 = createMask(h4);
numPixels = sum(BW4(:));
area4 = numPixels * 0.000054832561;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMAGE 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
roi5Again = 1;
    while roi5Again == 1
        image(image5)
        h5 = imfreehand;
        fprintf(['What do you want to do with this image?\nSelect a new region of interest = 1\n' ,...
            'Keep the region selected = 2\n'])
        roi5Again = input('');
            while roi5Again ~= 1 && roi5Again ~= 2
                roi5Again = input('Please enter a valid number (1 or 2): ');
            end
    end
clc
BW5 = createMask(h5);
numPixels = sum(BW5(:));
area5 = numPixels * 0.000054832561;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% IMAGE 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
roi6Again = 1;
    while roi6Again == 1
        image(image6)
        h6 = imfreehand;
        fprintf(['What do you want to do with this image?\nSelect a new region of interest = 1\n' ,...
            'Keep the region selected = 2\n'])
        roi6Again = input('');
            while roi6Again ~= 1 && roi6Again ~= 2
                roi6Again = input('Please enter a valid number (1 or 2): ');
            end
    end
clc
BW6 = createMask(h6);
numPixels = sum(BW6(:));
area6 = numPixels * 0.000054832561;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%% CSA bar graphic %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y = [area1 area2 area3 area4 area5 area6];
bar(y,'m')
xlabel('Image Number')
ylabel('CSA(cm2)')
print -djpeg PlotCSA.jpeg
%%
%%%%%%%%%%%%%%%%%% Volume determination and data export %%%%%%%%%%%%%%%%%%%
volume = muscleVolume(area1, area2, area3, area4, area5, area6, distance);
resultsTable = table(area1,area2,area3,area4,area5,area6,volume, 'VariableNames', {'CSA1' 'CSA2' 'CSA3' 'CSA4' 'CSA5' 'CSA6' 'Muscle_Volume'});
writetable(resultsTable,'Muscle_volume_result.xlsx')
fprintf(['An excel file named "Muscle_volume_results" has been created with\n' ,...
    'the results of each image cross sectional area (cm2)and the volume of \n' ,...
    'the muscle (cm3). Also a jpeg image named "PlotCSA" was created, containing\n' ,...
    'a bar graphic with the cross sectional area of each image.\n'])