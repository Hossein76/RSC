
clear ; close all; clc

%% parameters
input_layer_size  = 400;  % assuming an image is  20*20 ... if the images you want to use are different then you need to change this value
num_labels = 10;          % 10 labels, from 1 to 10
                          % since for the rizmo project you have 10 persons
                          % you dont need to change this value

%%  images 
%  here i just show you some images from the data set
%  for rizmo project delete this part
%

fprintf('loading the data set \n')

load('data_set.mat'); % in this mat file there are two vectors .. X is a 
                      % 5000 * 400 vector  and y is a 5000 * 1 vector ... 
                      % for rizmo project you should store each image in X
                      % vector .. image one goes to row one of X ... if
                      % X has 400 Column because each image is 20*20 if
                      % for rizmo you need to be carful about this and one
                      % other thing if for example image number 457 belongs
                      % to person 7 then y(457)=7 .. got it??

                     
      % X=importdata('X.txt');
      % y=importdata('y.txt');


                     
m = size(X, 1);

rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

display_data(sel);

fprintf('enjoy.\n');
pause;

%% training
% ok here is where the fun begins ... assuming that you have good X and y
% vectors we can start training ... but .. there is a parameter named
% lambda ... this is a special parameter used to insure that our model will
% not overfit to the data ... i know that you understanded nothing so for
% rizmo project set lambda to 0 ok?? and if by any chance you really want
% to know what lambda is .. either google it or ask me ... happy now??

fprintf('\n training.\n')
lambda = 0.1;
[all_theta] = OVA(X, y, num_labels, lambda);
% at this point we have the theta vector ... having the theta vector means
% we are done with training and we have successfully created our model for
% rizmo project .
fprintf('training done\n');
pause;


%% accuracy
% here we check accuracy of our model 

% load('test_set.mat'); age farz konim ke testset matris haye X_test va y_test ro dare 
% mizarim   pred = accuracy(all_theta, X_test);
%           fprintf('\n Accuracy: %f\n', mean(double(pred == y_test)) * 100);


 % X_test=importdata('X_test.txt');
 %      y_test=importdata('y_test.txt');
 %pred = accuracy(all_theta, X_test);
 %fprintf('\n Accuracy: %f\n', mean(double(pred == y_test)) * 100);

pred = accuracy(all_theta, X);

fprintf('\n Accuracy: %f\n', mean(double(pred == y)) * 100);

