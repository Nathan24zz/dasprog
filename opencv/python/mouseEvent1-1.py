# kita click kiri, jika satu titik muncul lingkaran
# jika dua titik muncul garis yang menyambung dengan titik sebelumnya
import cv2

def clickEvent(event,x,y,flags,param):
  if event == cv2.EVENT_LBUTTONDOWN:
    if len(point)<1:
      cv2.circle(img,(x,y),5,(255,255,0),-1)
    else:
      cv2.line(img,point[-1],(x,y),(255,255,0),5)
    point.append((x,y))
    cv2.imshow('Image', img)
    
point = []
img = cv2.imread("../lena.jpg")
cv2.imshow('Image', img)

cv2.setMouseCallback('Image', clickEvent)

k = cv2.waitKey(0)
if k == 27:   # 'Esc'
  cv2.destroyAllWindows()

