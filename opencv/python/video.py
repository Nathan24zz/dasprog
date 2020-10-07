import cv2

cap = cv2.VideoCapture(0)
# print("Width = ", cap.get(cv2.CAP_PROP_FRAME_WIDTH))
# print("Height = ", cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

fourcc = cv2.VideoWriter_fourcc(*'XVID')
out = cv2.VideoWriter('output.avi', fourcc, 20.0, (640,480))
                                          # fps, (width,height)

print(cap.isOpened())   # return True/False. 
while cap.isOpened():
  ret, frame = cap.read()
  if ret:

    frameGray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    out.write(frameGray)
    cv2.imshow('frame',frameGray)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
      break
  else:
    break

cap.release()
out.release()
cv2.destroyAllWindows()
