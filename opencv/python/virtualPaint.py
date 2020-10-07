# PROJECT 1
# MASALAH :
# masih ngak faham cara kerja 'count'
# warna merah belum terdeteksi dengan bagus
# pada awal-awal selalu keluar lingkaran hijau (opencv mendeteksi sendiri) jika tdk ada warna yg hijau terdeteksi

import cv2
import numpy as np 

cap = cv2.VideoCapture(1)
# cap.set(10,100)

my_colors = [
  [170,70,50,180,255,255],
  [36,25,25,70,255,255],
  [85,110,0,140,255,255] 
]

my_colors_val = [
  [0,0,255],
  [0,255,0],
  [255,0,0]
]

my_points = [] #[x,y,colorID]

# untuk mendeteksi warna
# menggambar lingkaran sesuai dengan warnanya
def findColor(img):
  hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
  count = 0
  for color in my_colors:
    lower = np.array(color[0:3])
    upper = np.array(color[3:6])
    mask = cv2.inRange(hsv, lower, upper) 
    # cv2.imshow(str(color[0]), mask)

    x,y = findContour(mask)
    # print(x,y)
    if x!=0 and y!=0:
      my_points.append([x,y,count])
      cv2.circle(frameResult,(x,y),10,my_colors_val[count],-1)
    count +=1

# untuk mencari contour 
def findContour(img):
  contours, hierarchy = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
  x,y,w,h = 0,0,0,0 
  
  for contour in contours:
    area = cv2.contourArea(contour)
    if area > 500:
      # cv2.drawContours(frameResult, contour, -1, (0,0,0), 1)
      peri = cv2.arcLength(contour, True)
      approx = cv2.approxPolyDP(contour, 0.02* peri, True)
      x,y,w,h = cv2.boundingRect(approx)

      # sebenarnya juga bisa langsung : x,y,w,h = cv2.boundingRect(contour)
  return x+w//2, y


def drawOnCanvas():
  for point in my_points:
    cv2.circle(frameResult,(point[0],point[1]),10,my_colors_val[point[2]],-1)


while cap.isOpened():
  _, frame = cap.read()
  frameResult = frame.copy()

  findColor(frame)
  # print(len(my_points))
  if len(my_points)!=0:
    drawOnCanvas()

  cv2.imshow("Result", frameResult)
  if cv2.waitKey(1) == 27:
    break

cap.release()
cv2.destroyAllWindows()