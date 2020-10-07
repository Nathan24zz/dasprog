# menggabungkan dua gambar
import cv2

img = cv2.imread("../messi5.jpg")
img1 = cv2.imread("../logo.jpg")

print(img.shape)
print(img.size)
print(img.dtype)
b, g, r = cv2.split(img)
img =  cv2.merge((b,g,r))

ball = img[280:340, 330:390]
img[273:333, 100:160] = ball

img = cv2.resize(img, (512,512))
img1 = cv2.resize(img1, (512,512))

# dst = cv2.add(img, img1)
dst = cv2.addWeighted(img, .8, img1, .2,0)

cv2.imshow("Image", dst)
k = cv2.waitKey(0)
if k == 27:   # 'Esc'
  cv2.destroyAllWindows()

