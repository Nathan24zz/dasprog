# shape and text
import cv2
import numpy as np

img = np.zeros((512,512,3), np.uint8)
img[:] = 255,0,0            # make it blue
# print(img)

cv2.line(img,(0,0),(img.shape[1],img.shape[0]),(0,255,0),3)
cv2.rectangle(img,(0,0),(250,300),(0,0,255),cv2.FILLED)
cv2.circle(img,(400,50),30,(255,255,0),-1)
cv2.putText(img, " OPENCV ", (300,200), cv2.FONT_HERSHEY_COMPLEX,1,(0,150,0),3)

# # make purple rectangle
# img[100:200,200:205] = 255,0,255    
# img[100:105,205:400] = 255,0,255  
# img[195:200,205:400] = 255,0,255  
# img[100:200,400:405] = 255,0,255  

cv2.imshow("Image", img)

k = cv2.waitKey(0)
if k == 27:   #'Esc'
  cv2.destroyAllWindows()