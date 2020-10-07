# showing image and video(from webcam too)
import cv2
# show image
# img = cv2.imread("../lena.jpg")
# cv2.imshow("Output", img)
# cv2.waitKey(1000)

# show video
# cap = cv2.VideoCapture("../video1.mp4")
# while True:
#   success, img = cap.read()
#   cv2.imshow("Video", img)
#   if cv2.waitKey(1) & 0xFF == ord('q'):
#     break

# show video from webcam
cap = cv2.VideoCapture(0)
cap.set(3,640)    #width
cap.set(4,480)    #height
# cap.set(10,100)   #brightness

while True:
  success, img = cap.read()
  cv2.imshow("Video", img)
  if cv2.waitKey(1) & 0xFF == ord('q'):
    break