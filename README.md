# Matlab Multivariate Goodness of Fit Chi Test
This is a multivariate Goodness of Fit test. It can be applied to any sort of multivariate distribution, so long as you can find the cdf or ddf of its intersections.

## Repo
This repo contains two files:
+ *mcgoft.m*    : the function itself
+ *example.m* : a few examples

## The function
```{matlab}
function [ Chi, pVal, nObs, nBin] = mcgoft( X, F, nBin, SUPMSG, waitCB)
```
### Inputs
#### Required Inputs
- **X**: The observations, should be a matrix with the columns representing variables and the rows representing observations. Example:
    ```{matlab}
        X = [1 2 3; 1 2 2; 0 1 2; 1 2 3; 3 1 1; 1 3 2];
    ```
    ```{}
        X =

             1     2     3
             1     2     2
             0     1     2
             1     2     3
             3     1     1
             1     3     2
    ```
- **F**: The de/cumulative distribution function, should be a function that takes on matrices or vectors and returns numeric evaluation of probability.
Example:
```{matlab}
    pd = makedist('Normal');
    F = @(x) prod(cdf(pd,x'),2);
```
#### Optional Inputs
- **nBin**: The number of bins that matlab will divide your dataset into. By default the number is *10*, which is useful for quick computations of large numbers of variable, but not very accurate.
- **SUPWARN**: suppress any messages or warnings. This should be a boolean.

### Outputs
Chi, pVal, nObs, nBin
- **pVal**: Bolean;   returns the p-value.
- **Chi**: Number;   chi-square-test score    
- **nObs**: Number;   The number of observations per variable
- **nBin**: Number;   The number of bins
- **bins**: Structure; all the bins with their values

