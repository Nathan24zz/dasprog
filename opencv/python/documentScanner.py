# PROJECT 2
import cv2
import numpy as np

width_img = 640
height_img = 480
cap = cv2.VideoCapture(0)   # camera from HP
cap.set(3, width_img)
cap.set(4, height_img)

def preProcessing(img):
  gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
  blur_img = cv2.GaussianBlur(gray_img, (5,5), 1)
  canny_img = cv2.Canny(gray_img,50,150)
  kernel = np.ones((5,5))
  dilate_img = cv2.dilate(canny_img, kernel, iterations=2)
  thres_img = cv2.erode(dilate_img, kernel, iterations=1)
  return thres_img


def findContour(img):
  contours, hierarchy = cv2.findContours(img, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)
  
  areas = []
  biggest = 0.0
  biggest_point = np.array([])
  for contour in contours:
    area = cv2.contourArea(contour)
    areas.append(area)
  areas.sort(reverse=True)
  if len(areas)!=0:
    # print(areas[0])
    biggest = areas[0]

  for contour in contours:
    area = cv2.contourArea(contour)
    if area == biggest and biggest!=0:
      peri = cv2.arcLength(contour, True)
      approx = cv2.approxPolyDP(contour, 0.02* peri, True)
      if len(approx) == 4:  
        biggest_point = approx

  cv2.drawContours(frame, biggest_point, -1, (0,255,0), 20)
  return biggest_point


def reorder (myPoints):
  myPoints = myPoints.reshape(4,2)
  # print(myPoints)
  myPointsNew = np.zeros((4,1,2),np.int32)
  add = myPoints.sum(1)
  #print("add = ", add)
  myPointsNew[0] = myPoints[np.argmin(add)]
  myPointsNew[3] = myPoints[np.argmax(add)]
  diff = np.diff(myPoints,axis=1)
  myPointsNew[1]= myPoints[np.argmin(diff)]
  myPointsNew[2] = myPoints[np.argmax(diff)]
  #print("NewPoints",myPointsNew)
  return myPointsNew


def findWarp(img, biggest_point):
  img_cropped = np.zeros_like(img)
  if biggest_point.size != 0:
    biggest_point = reorder(biggest_point)
    pts1 = np.float32(biggest_point)
    pts2 = np.float32([[0,0],[width_img,0],[0,height_img],[width_img, height_img]])
    matrix = cv2.getPerspectiveTransform(pts1,pts2)
    img_result = cv2.warpPerspective(img, matrix,(width_img, height_img))

    # biar piggiran yg gk perlu ngak ikutan (gbr lebih rapi)
    img_cropped = img_result[20:img_result.shape[0]-20, 20:img_result.shape[1]-20]
    img_cropped = cv2.resize(img_cropped,(width_img,height_img))
  return img_cropped


while cap.isOpened():
  _, frame = cap.read()
  frame = cv2.resize(frame, (width_img, height_img))
  # karena pake kamera HP, perlu di-rotate. Tapi kalau di-rotate tambah gk jelas nanti
  # frame = cv2.rotate(frame, cv2.ROTATE_90_CLOCKWISE)  

  thres_frame = preProcessing(frame)
  biggest_point = findContour(thres_frame)
  img_result = findWarp(frame, biggest_point)

  cv2.imshow("Original", frame)
  # cv2.imshow("Process", thres_frame)
  cv2.imshow("Result", img_result)
  if cv2.waitKey(1) == 27:
    break
cap.release()
cv2.destroyAllWindows()