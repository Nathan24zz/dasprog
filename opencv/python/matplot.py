import cv2
import matplotlib.pyplot as plt

img =  cv2.imread("../lena.jpg")
cv2.imshow("Image", img)
imgRGB = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

plt.imshow(imgRGB)
plt.xticks([]), plt.yticks([])
plt.show()

key = cv2.waitKey(0)
if key == 27:
  cv2.destroyAllWindows()