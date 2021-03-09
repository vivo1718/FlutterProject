import cv2 as cv
#img = cv.imread('photos/orang.jpg')
#cv.imshow('Photo',img)
def rescaleFrame(frame,scale=0.25):
    width = int(frame.shape[1]*scale)
    height = int(frame.shape[1]*scale)
    dimensions = (width,height)
    return cv.resize(frame,dimensions,interpolation=cv.INTER_AREA)




capture = cv.VideoCapture('videos/dog.mp4')
while True:
    isTrue,frame = capture.read()
    frame_resized = rescaleFrame(frame,scale=.15)

    #cv.imshow('Mydog',frame)
    cv.imshow('Video Resized',frame_resized)
    
    if cv.waitKey(20)& 0xFF==ord('e'):
        break
capture.release()

cv.destroyAllWindows()
