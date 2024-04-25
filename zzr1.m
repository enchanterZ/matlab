theta1 = rand(); 
theta2 = rand() * 5; 
theta3 = rand();
theta4 = rand() * 2; 
t_values = linspace(0, 1, 200);

epsilon_values = theta1 * (1 - exp(-theta2 * t_values)) + theta3 * (exp(theta4 * t_values) - 1);
inputs_normalized = mapminmax(t_values);

% 将数据集可视化
figure;
plot(t_values, epsilon_values, 'o');
xlabel('t');
ylabel('\epsilon');
title('生成的数据集');

% 构建神经网络
input_size = 1;
hidden_neurons = 10;
net = fitnet(hidden_neurons);
net.trainParam.lr = 0.01;
net.trainParam.epochs = 500;

% 将数据格式转换为神经网络输入格式
inputs = inputs_normalized';
targets = epsilon_values';

train_ratio = 0.8;
train_indices = randperm(length(inputs), round(train_ratio * length(inputs)));
test_indices = setdiff(1:length(inputs), train_indices);
train_inputs = inputs(train_indices, :);
train_targets = targets(train_indices, :);
test_inputs = inputs(test_indices, :);
test_targets = targets(test_indices, :);
view(net);
net = train(net, train_inputs', train_targets');

% 使用测试集评估神经网络性能
predicted_targets = net(test_inputs');
error_vector = predicted_targets - test_targets';
mse_value = mean(error_vector.^2);

disp(['测试数据上的均方误差：' num2str(mse_value)]);
