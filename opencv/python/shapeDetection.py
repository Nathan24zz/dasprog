import cv2

img = cv2.imread("../shape.jpg")
imgGray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
imgBlur = cv2.GaussianBlur(imgGray,(7,7),1)
imgCanny = cv2.Canny(imgBlur,50,50)
contours, hierarchy = cv2.findContours(imgCanny, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)

for contour in contours:
  # area = cv2.contourArea(contour)
  # print(area)
  peri = cv2.arcLength(contour, True)
  # print(peri)
  approx = cv2.approxPolyDP(contour, 0.02* peri, True)
  # print(len(approx))
  cv2.drawContours(img, contour, -1, (0,0,0), 3)
  (x,y,w,h) = cv2.boundingRect(contour)
  
  if len(approx) == 3:
    objectType = "Triangle"
  elif len(approx) == 4:
    aspectRatio = float(w)/h
    if aspectRatio >=0.95 and aspectRatio<=1.05:
      objectType = "Square"
    else: 
      objectType = "Rectangle"
  elif len(approx) == 5:
    objectType = "Pentagon"
  elif len(approx) == 10:
    objectType = "Star"
  else:
    objectType = "Circle"

  cv2.putText(img, objectType, (x+(w//2)-20, y+(h//2)), cv2.FONT_HERSHEY_COMPLEX,0.5,(0,0,0),2)

cv2.imshow("Image", img)
cv2.imshow("canny",imgCanny)

cv2.waitKey(0)
cv2.destroyAllWindows()