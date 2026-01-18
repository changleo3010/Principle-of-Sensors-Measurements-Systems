% 定義參數
Fs = 1000;               % 取樣頻率
T = 1/Fs;                % 取樣週期
L = 1500;                % 訊號長度
t = (0:L-1) * T;         % 時間向量

% 產生輸入訊號 (正弦波 )
inputSignal = 2.5 * sin(2 * pi * 5 * t) + 10*sin(2 * pi * 100 * t) ;

% 產生輸出訊號 (經過低通濾波器)
outputSignal = lowpass(inputSignal, 10, Fs); % 截止頻率為10Hz的低通濾波器

% 計算輸入訊號的 FFT
Y_input = fft(inputSignal);
P2_input = abs(Y_input/L);
P1_input = P2_input(1:L/2+1);
P1_input(2:end-1) = 2 * P1_input(2:end-1);
f = Fs * (0:(L/2)) / L;

% 計算輸出訊號的 FFT
Y_output = fft(outputSignal);
P2_output = abs(Y_output/L);
P1_output = P2_output(1:L/2+1);
P1_output(2:end-1) = 2 * P1_output(2:end-1);

% 绘制输入信号的频谱
figure;
subplot(2, 1, 1);
plot(f, P1_input);
title('Single-Sided Amplitude Spectrum of Input Signal');
xlabel('f (Hz)');
ylabel('|P1(f)|');

% 繪製輸出訊號的頻譜
subplot(2, 1, 2);
plot(f, P1_output);
title('Single-Sided Amplitude Spectrum of Output Signal');
xlabel('f (Hz)');
ylabel('|P1(f)|');
