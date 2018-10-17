import numpy as np
import cv2

detector= cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
cap = cv2.VideoCapture(0)
recognizer = cv2.face.LBPHFaceRecognizer_create()
recognizer.read('trainer/trainingData.yml')
id=0
font=cv2.FONT_HERSHEY_COMPLEX_SMALL
fontScale = 1
fontColor = (255, 255, 255)

while(True):
    ret, img = cap.read()
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
    faces = detector.detectMultiScale(gray, 1.3, 5)
    for (x,y,w,h) in faces:
        cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
        id,conf=recognizer.predict(gray[y:y+h,x:x+w])

        #Check the ID if exists
        if(conf<70):
            if(id==1):
                id = "Zarka {0:.2f}%".format(round(100 - conf, 2))
            elif(id==2):
                id = "Michael {0:.2f}%".format(round(100 - conf, 2))
        else:
            id = "Unknown {0:.2f}%".format(round(100 - conf, 2))

        #Put text
        #cv2.putText(img, str(id),font,(x,y+h), fontScale, fontColor);
        #cv2.rectangle(img, (x-33,y-90), (x+w+33, y-22), (255,0,0), -1)
        cv2.putText(img, str(id), (x,y-40), font, 1, (255,255,255), 2)

    cv2.imshow('img',img)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break
    
cap.release()
cv2.destroyAllWindows()
