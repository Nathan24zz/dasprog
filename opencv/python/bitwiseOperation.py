import cv2
import numpy as np 

img = np.zeros((250,500), np.uint8)
img1 = img.copy()

cv2.rectangle(img,(250,0),(500,250),(255,255,255),-1)
cv2.rectangle(img1,(200,0),(300,100),(255,255,255),-1)

# bit_and = cv2.bitwise_and(img, img1)
# bit_or = cv2.bitwise_or(img, img1)
# bit_xor = cv2.bitwise_xor(img, img1)
bit_not = cv2.bitwise_not(img)
bit_not1 = cv2.bitwise_not(img1)

cv2.imshow("Image", img)
cv2.imshow("Image1", img1)
# cv2.imshow("bit_and", bit_and)
# cv2.imshow("bit_or", bit_or)
# cv2.imshow("bit_xor", bit_xor)
cv2.imshow("bit_not", bit_not)
cv2.imshow("bit_not1", bit_not1)

k = cv2.waitKey(0)
if k == 27:   # 'Esc'
  cv2.destroyAllWindows()