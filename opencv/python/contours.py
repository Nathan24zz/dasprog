import cv2
import numpy as np 

img = cv2.imread("../opencv-logo.png")
img = cv2.resize(img,(500,639))
imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
_, thresh = cv2.threshold(imgGray, 180, 255, 0)
contours, hierarchy = cv2.findContours(thresh, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
print(len(contours))
print(contours[0])

cv2.drawContours(img, contours, -1, (255,0,255), 3 )

cv2.imshow("Image", img)
cv2.imshow("Gray", imgGray)
cv2.imshow("threshold", thresh)
cv2.waitKey(0)
cv2.destroyAllWindows()
