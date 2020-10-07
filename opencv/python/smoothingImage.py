# LPF(low pass filter) --> helps in removing noise, blurring the images 
# HPF(high pass filter) --> helps in finding edges in the images
# Example of LPF:
# 1. Blur
# 2. Gaussian filter is nothing but using different-weight kernel, in both x and y direction
#    Gaussian blue method is designed specifically for removing the high frequency noise
#    from the image like Halftone_Gaussian_Blur.jpg
# 3. Median Filter is suit for salt-and-paper noise
# 4. BilateralFilter is filter to remove noise whilr keeping the edges still sharp

import cv2
import numpy as np 
import matplotlib.pyplot as plt

# img = cv2.imread("../opencv-logo.png")
# img = cv2.imread("../Halftone_Gaussian_Blur.jpg")
# img = cv2.imread("../water.png")
img = cv2.imread("../lena.jpg")
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

kernel = np.ones((5,5), np.float32)/25
dst = cv2.filter2D(img, -1, kernel)
blur = cv2.blur(img, (5,5))
gblur = cv2.GaussianBlur(img, (5,5), 0)
# in median filter, the kernel must be odd except 1 (kernel is the 2nd argument) 
median = cv2.medianBlur(img, 5)
bilateralFilter = cv2.bilateralFilter(img, 9, 75, 75)

titles = ["original", "2D Convolution", "blur", "GaussianBlur", "median", "bilateralFilter"]
images = [img, dst, blur, gblur, median, bilateralFilter]

for i in range(6):
  plt.subplot(2,3,i+1)
  plt.imshow(images[i])
  plt.title(titles[i])
  plt.xticks([]), plt.yticks([])

plt.show()