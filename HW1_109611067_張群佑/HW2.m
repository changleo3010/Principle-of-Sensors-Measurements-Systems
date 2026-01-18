% Step 1: Generate sample data
t = [1:10]; % Sample time points
std_dev = [1.1, 2.5, 4.2, 6.3, 8.9, 11.2, 13.8, 16.5, 19.1, 21.9]; % Corresponding standard deviations

% Step 2: Define the equation
equation = @(c, t) c(1) * t.^c(2);

% Step 3: Perform curve fitting
c0 = [1, 1]; % Initial guess for parameters c1 and c2
options = optimset('Display', 'iter'); % Display fitting progress
fit_result = lsqcurvefit(equation, c0, t, std_dev, [], [], options);

% Step 4: Extract the parameter c2
c2 = fit_result(2);

% Display the result
disp(['Parameter c2: ', num2str(c2)]);