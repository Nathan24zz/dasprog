# Tujuan : Mendeteksi jalur dimana mobil kita melaju
# Pertama tentukan daerah mana yg kita inginkan, tapi sebelum itu rubah terlebih dahulu gbr jadi grayscale lalu canny
# hal ini dilakukan agar saat kita membuat mask, garis-garis yg membatasi mask tdk ikut terdeteksi juga
# Agar bisa memilih daerah yg kita inginkan, kita buat mask yg di dlmnya terdapat bentuk yg sesuai dgn daerah yg kita inginkan
# Lalu terapkan bitwise operation
# Kemudian kita gunakan fungsi HoughLinesP() utk mengetahui titik-titik agar dapat membuat garis
# Setelah kita mengetahui titik-titik tersebut, tinggal menggunakan fungsi line() utk menggambar garisnya
import cv2
import numpy as np 
import matplotlib.pylab as plt

def regionOfInterest(img, vertices):
  mask = np.zeros_like(img)
  # channel_count = img.shape[2]
  match_mask_color = 255 #* channel_count
  cv2.fillPoly(mask, vertices, match_mask_color)
  masked_image = cv2.bitwise_and(img, mask)
  return masked_image

def drawLine(img, lines):
  line_img = np.zeros_like(img)
  for line in lines:
    x1,y1,x2,y2 = line[0]
    cv2.line(line_img, (x1, y1), (x2, y2), (0, 255,0), 5)

  # merge 2 images
  img = cv2.addWeighted(img, 0.8, line_img, 1, 0.0)
  return img
  
img = cv2.imread("../road.png")
img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

print(img.shape)
height = img.shape[0]
width = img.shape[1]

region_of_interest_vertices = [
  (200,height),
  (1100, height),
  (550, 250)
]

gray_image = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
canny_image = cv2.Canny(gray_image, 50, 150)
cropped_image = regionOfInterest(canny_image,
                np.array([region_of_interest_vertices], np.int32))
lines = cv2.HoughLinesP(cropped_image, 1, np.pi/180, 100, maxLineGap = 50, minLineLength = 10)

img_with_lines = drawLine(img, lines)

plt.imshow(img_with_lines)
plt.show()



