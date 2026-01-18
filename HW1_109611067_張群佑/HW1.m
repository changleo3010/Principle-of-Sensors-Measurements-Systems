% Parameters
num_sets = 100;
num_points = 1000;
std_dev = 2.5;
sampling_time = 0.001; % 1 ms

% Generate random signals
signals = zeros(num_points, num_sets);
for i = 1:num_sets
    signals(:, i) = std_dev * randn(num_points, 1);
end

% Calculate mean and standard deviation for each set
mean_values = mean(signals, 2);
std_dev_values = std(signals, 0, 2);

% Integrate each set of signals (sum over time)
integrated_mean = cumsum(mean_values) * sampling_time;
integrated_std_dev = sqrt(cumsum(std_dev_values.^2)) * sampling_time;

% Plot mean value as a function of time
figure;
plot(0:sampling_time:(num_points-1)*sampling_time, integrated_mean);
xlabel('Time (s)');
ylabel('Mean Value');
title('Mean Value of 100 Signals Over Time');

% Plot standard deviation as a function of time
figure;
plot(0:sampling_time:(num_points-1)*sampling_time, integrated_std_dev);
xlabel('Time (s)');
ylabel('Standard Deviation');
title('Standard Deviation of 100 Signals Over Time');