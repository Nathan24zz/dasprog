import cv2
import matplotlib.pyplot as plt

img = cv2.imread("../gradien.jpg")
_, th1 = cv2.threshold(img, 50, 255, cv2.THRESH_BINARY)
_, th2 = cv2.threshold(img, 200, 255, cv2.THRESH_BINARY_INV)
_, th3 = cv2.threshold(img, 127, 255, cv2.THRESH_TRUNC)
_, th4 = cv2.threshold(img, 127, 255, cv2.THRESH_TOZERO)
_, th5 = cv2.threshold(img, 127, 255, cv2.THRESH_TOZERO_INV)

titles = ['Original Image','BINARY','BINARY_INV','TRUNC','TOZERO','TOZERO_INV']
images = [img, th1 ,th2 ,th3 ,th4, th5]

for i in range(6):
  plt.subplot(2, 3, i+1)
  plt.imshow(images[i])
  plt.title(titles[i])
  plt.xticks([]),plt.yticks([])

#cv.imshow("Image", img)
#cv.imshow("th1", th1)
#cv.imshow("th2", th2)
#cv.imshow("th3", th3)
#cv.imshow("th4", th4)
#cv.imshow("th5", th5)
plt.show()
#cv.waitKey(0)
#cv.destroyAllWindows()