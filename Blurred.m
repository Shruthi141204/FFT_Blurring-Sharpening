original_image = imread("C:\Users\shrut\OneDrive\Desktop\qq.jpg"); % Read the image

% Convert image to grayscale if it's a color image
if size(original_image, 3) == 3
    original_image = rgb2gray(original_image);
end

fft_image = fft2(original_image); % Perform FFT

fft_image_shifted = fftshift(fft_image); % Shift zero frequency component to the center

% Manipulate the frequency domain (e.g., apply a filter)
% For example, let's remove high frequency noise by setting high frequency components to zero
mask = zeros(size(original_image)); % Define a mask to keep only low frequencies
mask(100:400, 100:400) = 1; % Example mask, adjust as needed

fft_image_shifted_masked = fft_image_shifted .* mask;  % Apply the mask to the frequency domain image
fft_image_shifted_masked = ifftshift(fft_image_shifted_masked); % Shift zero frequency component back to the corner
manipulated_image = abs(ifft2(fft_image_shifted_masked)); % Inverse FFT

figure;
subplot(1, 2, 1);
imshow(original_image);
title('Original Image');

subplot(1, 2, 2);
imshow(manipulated_image, []);
title('Manipulated Image');
