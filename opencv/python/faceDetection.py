# mendeteksi muka dan mata
import cv2

face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
eye_cascade = cv2.CascadeClassifier('haarcascade_eye_tree_eyeglasses.xml')
cap = cv2.VideoCapture(0)

while cap.isOpened():
  _, frame = cap.read()
  gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
  faces = face_cascade.detectMultiScale(gray, 1.1, 4)
  eye = eye_cascade.detectMultiScale(gray)
  
  for (x,y,w,h) in faces:
    cv2.rectangle(frame, (x,y), (x+w, y+h), (255,0,0), 3)
  
  for (ex,ey,ew,eh) in eye:
    cv2.rectangle(frame, (ex,ey), (ex+ew, ey+eh), (0,255,0), 3)

  cv2.imshow("Frame", frame)
  if cv2.waitKey(1) & 0xFF == 27:
    break

cap.release()
cv2.destroyAllWindows()