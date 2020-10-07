import cv2
import numpy as np
import matplotlib.pyplot as plt

img = cv2.imread("../messi5.jpg", 0)
# img = cv2.imread("../sudoku1.jpg", 0)
lap = cv2.Laplacian(img, cv2.CV_64F, ksize=3)
lap = np.uint8(np.absolute(lap))  # merubah dari float jadi int biar bisa ditampilin
sobelX = cv2.Sobel(img, cv2.CV_64F, 1, 0)
sobelX = np.uint8(np.absolute(sobelX))
sobelY = cv2.Sobel(img, cv2.CV_64F, 0, 1)
sobelY = np.uint8(np.absolute(sobelY))
sobelCombine = cv2.bitwise_or(sobelX, sobelY)
canny = cv2.Canny(img,100,200)

titles = ["original", "Laplacian", "SobelX", "SobelY", "SobelCombine", "Canny"]
images = [img, lap, sobelX, sobelY, sobelCombine, canny]

for i in range(6):
  plt.subplot(2,3,i+1)
  plt.imshow(images[i], 'gray')
  plt.title(titles[i])
  plt.xticks([]), plt.yticks([])

plt.show()