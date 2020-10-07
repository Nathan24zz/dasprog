# template matching = method for searching and finding the location 
#                     of a template image inside a larger image
# point which top-left corner "messi_face.jpg" will match inside "messi5.jpg", that will be the brightess point
import cv2
import numpy as np

img = cv2.imread("../messi5.jpg")
gray_img = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
template = cv2.imread("../messi_face.jpg",0)
w, h = template.shape[::-1]
# print(w,h)

res = cv2.matchTemplate(gray_img, template, cv2.TM_CCORR_NORMED )
print(res)
threshold = 0.99
loc =  np.where(res>=threshold)
print(loc)

for pt in zip(*loc[::-1]):
  cv2.rectangle(img, pt, (pt[0] + w, pt[1] + h), (0, 0, 255), 2)

cv2.imshow("Image", img)
cv2.waitKey(0)
cv2.destroyAllWindows()
