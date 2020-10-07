# adaptive threshold itu hanya bekerja pada gbr grayscale
# jadi kalau gbrnya bgr hrs diconvert ke grayslace dulu
import cv2

img = cv2.imread("../sudoku1.jpg")
# imgResize = cv2.resize(img,(512,512))
imgGray =  cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
ths1 = cv2.adaptiveThreshold(imgGray, 255, cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY, 11, 2)
ths2 = cv2.adaptiveThreshold(imgGray, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 11, 2)

cv2.imshow("ImageResize", img)
cv2.imshow("ths1", ths1)
cv2.imshow("ths2", ths2)

key = cv2.waitKey(0)
if key == 27:
  cv2.destroyAllWindows()