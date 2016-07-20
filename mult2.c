#include "mex.h"

void timestwo_alt(int *y, int a, int b, int c, int d)
{
  *y = a+b+c+d;
}


void mexFunction(int nlhs, mxArray *plhs[],
                 int nrhs, const mxArray *prhs[])
{
  int *y;
  int x1;
  int x2;
  int x3;
  int x4;

  /* Create a 1-by-1 matrix for the return argument. */
  plhs[0] = mxCreateNumericArray(mxGetNumberOfDimensions(prhs[0]), mxGetDimensions(prhs[0]),
                          mxINT32_CLASS, (mxIsComplex(prhs[0]) ? mxCOMPLEX : mxREAL));

  /* Get the scalar value of the input x. */
  /* Note: mxGetScalar returns a value, not a pointer. */
  x1 = mxGetScalar(prhs[0]);
  x2 = mxGetScalar(prhs[1]);
  x3 = mxGetScalar(prhs[2]);
  x4 = mxGetScalar(prhs[3]);

  /* Assign a pointer to the output. */
  y = mxGetPr(plhs[0]);
  
  /* Call the timestwo_alt subroutine. */
  timestwo_alt(y,x1,x2,x3,x4);
}