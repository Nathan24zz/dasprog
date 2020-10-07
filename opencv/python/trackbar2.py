# membuat window dengan 2 trackbar yang dapat mengatur gbr dr window tsb
# bisa berupa grayscale atau gbr normal 
import cv2 

def nothing(x):
  pass



cv2.namedWindow('Image')

cv2.createTrackbar('Value', 'Image', 10, 400, nothing)
cv2.createTrackbar('Color/Gray', 'Image', 0, 1, nothing)

while True:
  img = cv2.imread('../lena.jpg')

  v = cv2.getTrackbarPos('Value', 'Image')
  g = cv2.getTrackbarPos('Color/Gray', 'Image')

  cv2.putText(img, str(v), (50,150), cv2.FONT_HERSHEY_COMPLEX,3,(0,150,0),3)
  if g == 1:
    img =  cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)


  img = cv2.imshow('Image', img)
  k = cv2.waitKey(1)
  if k == 27:   # 'Esc'
    break

cv2.destroyAllWindows()