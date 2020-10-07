# bisa gambar kotak dengan click kiri pada dua titik, 
# tp setelah gbr 1 kotak hrs dihapus dulu baru bisa gambar kotak lainnya
import cv2 

count = 0
def mouseDrawing(event, x, y, flags, params):
  if event == cv2.EVENT_LBUTTONDOWN:
    global count
    print("left click")
    rectangle[count]=(x,y)
    print(rectangle[0])
    print(rectangle[1])
    count =  count + 1
    

cap = cv2.VideoCapture(0)

cv2.namedWindow("Frame")
cv2.setMouseCallback("Frame", mouseDrawing)


rectangle = [(0,0),(0,0)]
while True:
  ret, frame = cap.read()

  if rectangle[1]!=(0,0):
    cv2.rectangle(frame,rectangle[0] ,rectangle[1],(0,0,255),2)

  cv2.imshow("Frame", frame)
  k = cv2.waitKey(1)
  if k == 27:
    break
  elif k ==  ord('d'):
    rectangle = [(0,0),(0,0)]
    count = 0


cap.release()
cv2.destroyAllWindows()