# kita click kiri, muncul koordinat (x,y)
# kita click kanan, muncul kombinasi warna BGR 
import cv2
import numpy as np 

def clickEvent(event,x,y,flags,param):
  if event == cv2.EVENT_LBUTTONDOWN:
    text = str(x)+', '+str(y)
    cv2.putText(img, text, (x,y), cv2.FONT_HERSHEY_SIMPLEX,0.6,(255,255,0),2)
    cv2.imshow('Image', img)
  elif event == cv2.EVENT_RBUTTONDOWN:
    blue = img[y, x, 0]
    green = img[y, x, 1]
    red = img[y, x, 2]
    strBGR = str(blue)+', '+str(green)+', '+str(red)
    cv2.putText(img, strBGR, (x,y), cv2.FONT_HERSHEY_SIMPLEX,0.6,(0,255,255),2)
    cv2.imshow('Image', img)

# img = np.zeros((512,512,3), np.uint8)
img = cv2.imread("../lena.jpg")
cv2.imshow('Image', img)

cv2.setMouseCallback('Image', clickEvent)

k = cv2.waitKey(0)
if k == 27:   # 'Esc'
  cv2.destroyAllWindows()