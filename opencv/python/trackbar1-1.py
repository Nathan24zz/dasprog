# membuat window dengan 3 trackbar yang dapat mengatur warna dr window tsb
# versi saya sendiri, pakai fungsi saya sendiri dan tdk pake fungsi dari opencv nya
# pada 'trackbar1.py' itu pakai fungsi dr opencv nya
import cv2
import numpy as np 

drawing = False
b=0
g=0
r=0 
def blue(x):
  global b, g, r
  b = x
  if drawing:
    img[:] = b,g,r

def green(x):
  global b, g, r
  g = x
  if drawing:
    img[:] = b,g,r

def red(x):
  global b, g, r
  r = x
  if drawing:
    img[:] = b,g,r

def switching(x):
  global drawing
  if x == 1:
    drawing = True
  else:
    drawing = False


img = np.zeros((300,512,3), np.uint8)
cv2.namedWindow('Image')
switch = '0 : OFF\n 1 : ON'

cv2.createTrackbar('B', 'Image', 0, 255, blue)
cv2.createTrackbar('G', 'Image', 0, 255, green)
cv2.createTrackbar('R', 'Image', 0, 255, red)
cv2.createTrackbar(switch, 'Image', 0, 1, switching)


while True:
  cv2.imshow('Image', img)

  k = cv2.waitKey(1)
  if k == 27:   # 'Esc'
    break
cv2.destroyAllWindows()