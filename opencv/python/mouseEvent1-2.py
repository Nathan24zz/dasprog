# jika kita click kiri, akan muncul window baru yg menunjukkan warna pada bagian yg tsb
import cv2
import numpy as np 

def clickEvent(event,x,y,flags,param):
  if event == cv2.EVENT_LBUTTONDOWN:
    blue = img[y, x, 0]
    green = img[y, x, 1]
    red = img[y, x, 2]
    color_image = np.zeros((512,512,3), np.uint8)
    color_image[:] = [blue,green,red]
    # color_image[:] = blue,green,red
    cv2.imshow('Color', color_image)
    

img = cv2.imread("../lena.jpg")
cv2.imshow('Image', img)

cv2.setMouseCallback('Image', clickEvent)

k = cv2.waitKey(0)
if k == 27:   # 'Esc'
  cv2.destroyAllWindows()

