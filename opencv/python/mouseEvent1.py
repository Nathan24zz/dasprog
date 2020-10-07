# kita click kiri, jika satu titik muncul lingkaran
# jika dua titik muncul garis
import cv2
import numpy as np 

drawing_line = False
temp = ()
def clickEvent(event,x,y,flags,param):
  global drawing_line,temp
  if event == cv2.EVENT_LBUTTONDOWN:
    if drawing_line is False:
      cv2.circle(img,(x,y),5,(255,255,0),-1)
      cv2.imshow('Image', img)
      temp = (x,y)
      drawing_line = True

    elif drawing_line is True:
      cv2.line(img,temp,(x,y),(255,255,0),5)
      cv2.imshow('Image', img)
      drawing_line = False

# img = np.zeros((512,512,3), np.uint8)
img = cv2.imread("../lena.jpg")
cv2.imshow('Image', img)

cv2.setMouseCallback('Image', clickEvent)

k = cv2.waitKey(0)
if k == 27:   # 'Esc'
  cv2.destroyAllWindows()
