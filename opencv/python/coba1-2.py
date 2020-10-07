# bisa gambar kotak dengan click kiri pada dua titik, 
# tp setelah gbr 1 kotak hrs dihapus dulu baru bisa gambar kotak lainnya
import cv2 

drawing =  False
point1 = ()
point2 = ()

def mouseDrawing(event, x, y, flags, params):
  global point1, point2, drawing
  if event == cv2.EVENT_LBUTTONDOWN:
    if drawing is False:
      point1 = (x,y)
      drawing = True
    elif drawing is True:
      drawing = False

  elif event == cv2.EVENT_MOUSEMOVE:
    if drawing is True:
      point2 = (x,y)

    

cap = cv2.VideoCapture(0)

cv2.namedWindow("Frame")
cv2.setMouseCallback("Frame", mouseDrawing)


while True:
  ret, frame = cap.read()

  if point1 and point2:
    cv2.rectangle(frame,point1,point2,(0,0,255),2)

  cv2.imshow("Frame", frame)
  k = cv2.waitKey(1)
  if k == 27:
    break
  elif k ==  ord('d'):
    point1=()
    point2=()


cap.release()
cv2.destroyAllWindows()