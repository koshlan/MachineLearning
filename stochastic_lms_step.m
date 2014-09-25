function [ my_w_out ] = stochastic_lms_step(my_w,my_data,my_target,my_obs,my_learning_rate)
%stochastic_lms Summary of this function goes here
%   Detailed explanation goes here
    ind = randi(10,1,1);
    % Lets use w to make a prediction for one value of our training set
    selected_data = my_data(ind,:);
    % Lets make a prediction using one point and our parameters in w
    selected_predict = dot(selected_data,my_w);
    % Lets see how we did and calculate the error
    selected_error = my_target(ind,:) - selected_predict;
    % Lets adjust w based on our learning rate, the error and the data
    my_w_out = my_w + my_learning_rate*selected_error*my_data(ind,:);
end

