import cv2
import datetime

cap = cv2.VideoCapture(0)

while cap.isOpened():
  ret, frame = cap.read()
  if ret:
    text = 'Width = '+ str(cap.get(3)) + ' Height = ' + str(cap.get(4))
    cv2.putText(frame, text, (10,30), cv2.FONT_HERSHEY_SIMPLEX,0.6,(0,255,255),2)

    date = str(datetime.datetime.now())
    cv2.putText(frame, date, (10,60), cv2.FONT_HERSHEY_SIMPLEX,0.6,(0,255,255),2)
    
    cv2.imshow('video',frame)
    
    if cv2.waitKey(1) &0xFF == ord('q'):
      break
  else:
    break

cap.release()
cv2.destroyAllWindows()