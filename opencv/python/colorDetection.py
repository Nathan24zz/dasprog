import cv2
import numpy as np 

def nothing(x):
  pass

cap = cv2.VideoCapture(0)
cv2.namedWindow("Trackbars")
cv2.createTrackbar("Hue Min", "Trackbars", 0, 180, nothing)
cv2.createTrackbar("Sat Min", "Trackbars", 0, 255, nothing)
cv2.createTrackbar("Val Min", "Trackbars", 0, 255, nothing)
cv2.createTrackbar("Hue Max", "Trackbars", 180, 180, nothing)
cv2.createTrackbar("Sat Max", "Trackbars", 255, 255, nothing)
cv2.createTrackbar("Val Max", "Trackbars", 255, 255, nothing)

while True:
  ret, frame = cap.read()
  hsv = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

  l_h = cv2.getTrackbarPos('Hue Min', "Trackbars")
  l_s = cv2.getTrackbarPos('Sat Min', "Trackbars")
  l_v = cv2.getTrackbarPos('Val Min', "Trackbars")
  u_h = cv2.getTrackbarPos('Hue Max', "Trackbars")
  u_s = cv2.getTrackbarPos('Sat Max', "Trackbars")
  u_v = cv2.getTrackbarPos('Val Max', "Trackbars")

  lower = np.array([l_h, l_s, l_v])
  upper = np.array([u_h, u_s, u_v])
  mask = cv2.inRange(hsv, lower,upper)

  result =  cv2.bitwise_and(frame, frame, mask=mask)

  # cv2.imshow("Frame", frame)
  # cv2.imshow("Mask", mask)
  cv2.imshow("Result", result)
  key = cv2.waitKey(1)
  if key ==  27:
    break
cap.release()
cv2.destroyAllWindows()