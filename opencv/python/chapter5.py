# warp perspective
import cv2
import numpy as np 

img = cv2.imread("../left07.jpg")

width, height = 200,300
# imgResult = np.zeros((height,width), np.uint8)
# cv2.imshow("yo", imgResult)
pts1 = np.float32([[215,70],[416,112],[121,351],[305,439 ]])
pts2 = np.float32([[0,0],[width,0],[0,height],[width,height]])
matrix = cv2.getPerspectiveTransform(pts1,pts2)
imgResult = cv2.warpPerspective(img, matrix,(width,height))

cv2.imshow("Image", img)
cv2.imshow("Output", imgResult)

k = cv2.waitKey(0)
if k == 27:   #'Esc'
  cv2.destroyAllWindows()

