% Read the input image
input_image = imread("C:\Users\shrut\OneDrive\Desktop\qq.jpg");

% Convert the image to grayscale if it's RGB
if size(input_image, 3) == 3
    input_image = rgb2gray(input_image);
end

% Perform FFT on the image
fft_image = fft2(double(input_image));

% Define a sharpening kernel (e.g., Laplacian)
sharpen_kernel = [0 -1 0; -1 5 -1; 0 -1 0]; % Laplacian kernel

% Resize the sharpening kernel to match the size of the FFT image
sharpen_kernel = imresize(sharpen_kernel, size(input_image));

% Apply the sharpening kernel in the frequency domain
sharpened_fft_image = fft_image + fft2(sharpen_kernel);

% Perform inverse FFT to obtain the sharpened image
sharpened_image = real(ifft2(sharpened_fft_image));

% Display the original and sharpened images
figure;
subplot(1, 2, 1); imshow(input_image); title('Original Image');
subplot(1, 2, 2); imshow(sharpened_image, []); title('Sharpened Image');
