# ketika click kiri mouse muncul lingkaran warna merah
# untuk menghapus lingkaran yg terakhir dibuat tekan tombol 'd'
# ketika lingkaran di layar tdk ada, maka tdk terjadi apa-apa
import cv2 

def mouseDrawing(event, x, y, flags, params):
  if event == cv2.EVENT_LBUTTONDOWN:
    print("left click")
    circles.append((x,y))

cap = cv2.VideoCapture(0)

cv2.namedWindow("Frame")
cv2.setMouseCallback("Frame", mouseDrawing)

circles = []
while True:
  ret, frame = cap.read()

  for center_position in circles:
    cv2.circle(frame,center_position,5,(0,0,255),-1)

  cv2.imshow("Frame", frame)
  k = cv2.waitKey(1)
  if k == 27:
    break
  elif k == ord('d'):
    if len(circles)>0:
      circles.pop()


cap.release()
cv2.destroyAllWindows()