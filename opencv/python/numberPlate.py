# PROJECT 3
# masih gk iso slur
import cv2

minArea = 200
count = 0

nPlateCascade = cv2.CascadeClassifier('haarcascade_russian_plate_number.xml')
cap = cv2.VideoCapture(1) 

while cap.isOpened():
  _, img = cap.read()
  imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
  numberPlates = nPlateCascade.detectMultiScale(imgGray, 1.1, 10)
  for (x, y, w, h) in numberPlates:
    area = w*h
    if area > minArea:
      cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 255), 2)
      cv2.putText(img,"Number Plate",(x,y-5),
                  cv2.FONT_HERSHEY_COMPLEX_SMALL,1,color,2)
      imgRoi = img[y:y+h,x:x+w]
      cv2.imshow("ROI", imgRoi)

  cv2.imshow("Result", img)
  k = cv2.waitKey(1)
  if k == ord('s'):
    cv2.imwrite("Scanned/NoPlate_"+str(count)+".jpg",imgRoi)
    cv2.rectangle(img,(0,200),(640,300),(0,255,0),cv2.FILLED)
    cv2.putText(img,"Scan Saved",(150,265),cv2.FONT_HERSHEY_DUPLEX,
                2,(0,0,255),2)
    cv2.imshow("Result",img)
    cv2.waitKey(500)
    count +=1
  elif k == 27:
    break
cap.release()
cv2.destroyAllWindows()