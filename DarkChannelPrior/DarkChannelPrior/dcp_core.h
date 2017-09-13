//
//  dcp_core.h
//  opencv_test
//
//  Created by xiaoruiqiao on 2017/9/3.
//  Copyright © 2017年 xiaoruiqiao. All rights reserved.
//

#ifndef dcp_core_h
#define dcp_core_h


#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <opencv2/opencv.hpp>
#include <opencv2/ximgproc.hpp>
#include <opencv2/core/core.hpp>

#include <iostream>
#include <vector>
#include <cstdio>
//#include <malloc.h>

//#include "utility.h"
using namespace cv;
using namespace std;
void CalcDarkChannel(IplImage *darkchannel, IplImage *input, int radius);
void CalcBrightChannel(IplImage *brightchannel, IplImage* input, int radius);
void CalcAirlight(IplImage *darkchannel, IplImage *input, double A[]);
void CalcTransmission(IplImage *transmission, IplImage *input, double A[], int radius);
void CalcRecover(IplImage *result, IplImage *input, IplImage *transmission, double A[]);
void GuidedFilterColor(IplImage *q, IplImage *II, IplImage *p, double eps, int r);
void MedianFilterSnow(IplImage *brightchannel, IplImage* input, int radius);
void CorseFilter(IplImage *value, IplImage *sturation, IplImage *dst_img, int radius);
void RemovalBaseMask(Mat input, Mat mask, Mat& output,int radius);
void FrameDiff(vector<Mat> input, Mat& ouput,Mat& frameNumOutput);



#endif /* dcp_core_h */