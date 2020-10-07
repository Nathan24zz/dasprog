# cropping and resize image
import cv2

img = cv2.imread("../butterfly.jpg")
print(img.shape)    # height, width

imgResize = cv2.resize(img,(300,200))   # width, height
print(imgResize.shape)

imgCropped = img[0:200, 200:300]

cv2.imshow("Image", img)
# cv2.imshow("Image Resize", imgResize)
cv2.imshow("Image Cropped", imgCropped)

k = cv2.waitKey(0)
if k == 27:   #'Esc'
  cv2.destroyAllWindows()