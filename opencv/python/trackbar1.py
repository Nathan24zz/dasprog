# membuat window dengan 3 trackbar yang dapat mengatur warna dr window tsb 
import cv2
import numpy as np 

def nothing(x):
  pass

img = np.zeros((300,512,3), np.uint8)
cv2.namedWindow('Image')
switch = '0 : OFF\n 1 : ON'

cv2.createTrackbar('B', 'Image', 0, 255, nothing)
cv2.createTrackbar('G', 'Image', 0, 255, nothing)
cv2.createTrackbar('R', 'Image', 0, 255, nothing)
cv2.createTrackbar(switch, 'Image', 0, 1, nothing)

while True:
  cv2.imshow('Image', img)

  b = cv2.getTrackbarPos('B', 'Image')
  g = cv2.getTrackbarPos('G', 'Image')
  r = cv2.getTrackbarPos('R', 'Image')
  s = cv2.getTrackbarPos(switch, 'Image')

  if s == 1:
    img[:] = b,g,r

  k = cv2.waitKey(1)
  if k == 27:   # 'Esc'
    break

cv2.destroyAllWindows()