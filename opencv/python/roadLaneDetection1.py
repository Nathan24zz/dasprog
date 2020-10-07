import cv2
import numpy as np

def regionOfInterest(img, vertices):
  mask = np.zeros_like(img)
  # channel_count = img.shape[2]
  match_mask_color = 255 #* channel_count
  cv2.fillPoly(mask, vertices, match_mask_color)
  masked_image = cv2.bitwise_and(img, mask)
  return masked_image

def drawLine(img, lines):
  line_img = np.zeros_like(img)
  if lines is not None:
    for line in lines:
      x1,y1,x2,y2 = line[0]
      cv2.line(line_img, (x1, y1), (x2, y2), (0, 255,0), 5)

  # merge 2 images
  img = cv2.addWeighted(img, 0.8, line_img, 1, 0.0)
  return img

cap = cv2.VideoCapture("../road.mp4")

while cap.isOpened():
  _, frame = cap.read()
  height = frame.shape[0]
  width = frame.shape[1]

  region_of_interest_vertices = [
    (200,height),
    (1100, height),
    (550, 250)
  ]
  
  gray_frame = cv2.cvtColor(frame, cv2.COLOR_RGB2GRAY)
  canny_frame = cv2.Canny(gray_frame, 50, 150)
  cropped_frame = regionOfInterest(canny_frame,
                  np.array([region_of_interest_vertices], np.int32))
  lines = cv2.HoughLinesP(cropped_frame, 1, np.pi/180, 100, maxLineGap = 50, minLineLength = 10)

  frame_with_lines = drawLine(frame, lines)

  cv2.imshow("Frame", frame_with_lines)
  if cv2.waitKey(1) == 27:
    break

cap.release()
cv2.destroyAllWindows()