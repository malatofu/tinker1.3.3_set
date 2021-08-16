#include <iostream>
#include <string>
#include <sstream>
using namespace std;

// OpenCV includes
#include </usr/local/include/opencv2/core.hpp>
#include </usr/local/include/opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
using namespace cv;

#define CIR_R 100
#define CENTER_X 90
#define CENTER_Y 150

#define IMG_X 1060
#define IMG_Y 560
#define IMG_R 115

int main(int argc, const char** argv)
{
	VideoCapture cap;
	cap.open("/dev/video10");
	if (!cap.isOpened())
		return -1;
	cap.set(CV_CAP_PROP_FRAME_WIDTH,1920);	
	cap.set(CV_CAP_PROP_FRAME_HEIGHT,1080);
	cap.set(CV_CAP_PROP_FOURCC,CV_FOURCC('M','J','P','G'));	
	namedWindow("Video", 1);
	setWindowProperty("Video",WND_PROP_FULLSCREEN,WINDOW_FULLSCREEN);
	for (;;)
	{
		Mat frame;
		cap >> frame; 
		if (frame.empty())
			return 0;
		Rect rect0(IMG_X-IMG_R,IMG_Y-IMG_R,2*IMG_R,2*IMG_R);
		Rect rect1(IMG_X-(2*CENTER_X)-IMG_R,IMG_Y-IMG_R,2*IMG_R,2*IMG_R);
		Rect rect2(IMG_X-CENTER_X-IMG_R,IMG_Y+CENTER_Y-IMG_R,2*IMG_R,2*IMG_R);
		rectangle(frame,rect0,Scalar(255,0,0),5,LINE_8,0);
		rectangle(frame,rect1,Scalar(255,0,0),5,LINE_8,0);
		rectangle(frame,rect2,Scalar(255,0,0),5,LINE_8,0);
		imshow("Video", frame);
		if (waitKey(30) >= 0) break;
	}
	cap.release();
	return 0;
}
