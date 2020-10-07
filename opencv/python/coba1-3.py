# bisa gambar kotak dengan click kiri pada dua titik
# lanjutan coba1-1.py
import cv2 

count = -1
def mouseDrawing(event, x, y, flags, params):
  global count
  if event == cv2.EVENT_LBUTTONDOWN:
    print("left click")
    rectangle.append((x,y))
    count =  count + 1
    

cap = cv2.VideoCapture(0)

cv2.namedWindow("Frame")
cv2.setMouseCallback("Frame", mouseDrawing)


rectangle = []
while True:
  ret, frame = cap.read()

  if count>0 and count%2==1:
    cv2.rectangle(frame,rectangle[-2] ,rectangle[-1],(0,0,255),2)

  cv2.imshow("Frame", frame)
  k = cv2.waitKey(1)
  if k == 27:
    break
  elif k ==  ord('d'):
    rectangle.pop()
    


cap.release()
cv2.destroyAllWindows()