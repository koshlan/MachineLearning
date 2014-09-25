% Koshlan Mayer-Blackwell {koshlan@stanford.edu}
% Lance Martin {rlance.martin@gmail.com>}
% cs229 Fall 2014 Week 1 Excercises 

%% Generate Some Fake Data
% To explore the simplest case, assume we have 10 target values and one
% feature for each of these target value in our training set
feature1 = [1,2,3,4,5,6,7,8,9,10]; 
feature1 = transpose(feature1); % transpose to get [1x10]
target = feature1*0.2 + 0.5 % Create some fake taget date [1x10]

% Scatter Plot the Data
figure(1)
scatter(feature1,target)
title('Goal') 
xlabel('feature1')
ylabel('target')
%% LMS lets consider our first step
% Now Suppose our challenge is to find two parameter s0 and s1 
% such that we minimize the squared errors y = s0 + s1(x1)

% suppose we start with some random guess for parameters s0 and s1 and
% place then in vector w. We will constantly be updateing w
s0 = 1
s1 = 1
w = [s0,s1]

% Lets augment feature1 with a row of 1s
data = [feature1 , ones(10,1)]

%%
% In Stochastic LMS, the idea here is that we can just choose one of training
% set pairs each iteration
% we need to be able to choose a random index integer value, this way we
% will be choosing just one of our training set each round
obs = length(feature1)
ind = int64(obs *rand())
% Lets use w to make a prediction for one value of our training set
my_data = data(ind,:)
% Lets make a prediction using one point and our parameters in w
my_predict = dot(my_data,w)
% Lets see how we did and calculate the error
my_error = target(ind,:) - my_predict
% Lets adjust w based on our learning rate, the error and the data
learning_rate = 0.1
w = w + learning_rate*my_error*data(ind,:)

%% Now in principle, we could do this 1000 times and see if w converges. 
% stochastic_lms_step(my_w,my_data,my_target,my_obs,my_learning_rate)
w = [s0,s1]
my_data = [feature1 , ones(10,1)]
my_target = target
my_obs = length(feature1)
my_learning_rate = 0.01
storage = zeros(3000,2);
for i = 1:3000
   w = stochastic_lms_step(w,my_data,my_target,my_obs,my_learning_rate);
   storage(i,:) = w;
end
%% Lets look at the output and see if we get convergence
figure(2)
plot(storage(:,1))
title('s1 parameter')
xlabel('steps')
%%
figure(3)
plot(storage(:,2))
title('s0 parameter estimate')
ylabel('steps')
%%
figure(4)
scatter(feature1,target)
title('Goal') 
xlabel('feature1')
ylabel('target')
hold on 
y = my_data*transpose(w)
x = my_data(:,1)
plot(x,y,'r')
hold off

