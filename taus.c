/*==========================================================
 * arrayProduct.c - example in MATLAB External Interfaces
 *
 * Multiplies an input scalar (multiplier) 
 * times a 1xN matrix (inMatrix)
 * and outputs a 1xN matrix (outMatrix)
 *
 * The calling syntax is:
 *
 *		outMatrix = arrayProduct(multiplier, inMatrix)
 *
 * This is a MEX-file for MATLAB.
 * Copyright 2007-2012 The MathWorks, Inc.
 *
 *========================================================*/

#include "mex.h"

void taus(
            unsigned long s1,
            unsigned long s2,
            unsigned long s3,
            unsigned long *c)
 {
    unsigned long b;
    b  = (((s1 << 13) ^ s1) >> 19);
    s1 = (((s1 & 4294967294) << 12) ^ b);
    b  = (((s2 << 2) ^ s2) >> 25);
    s2 = (((s2 & 4294967288) << 4) ^ b);
    b  = (((s3 << 3) ^ s3) >> 11);
    s3 = (((s3 & 4294967280) << 17) ^ b);
    *c = (s1 ^ s2 ^ s3);
}

/* The gateway function */
void mexFunction( unsigned long  nlhs, mxArray *plhs[],
                  unsigned long  nrhs, const mxArray *prhs[])
{
    unsigned long multiplier1, multiplier2, multiplier3; /* input scalar */
    unsigned long *outMatrix;              /* output matrix */
    
   
  
    /* get the value of the scalar input  */
      multiplier1 = mxGetScalar(prhs[0]);
      multiplier2 = mxGetScalar(prhs[1]);
      multiplier3 = mxGetScalar(prhs[2]);

     plhs[0] = mxCreateNumericArray(mxGetNumberOfDimensions(prhs[0]), mxGetDimensions(prhs[0]),
                                  mxINT32_CLASS, (mxIsComplex(prhs[0]) ? mxCOMPLEX : mxREAL));
    
  
  
    /* create the output matrix */
    outMatrix   =  mxGetPr(plhs[0]);

    /* call the computational routine */
    taus(multiplier1,multiplier2,multiplier3,outMatrix);
}
