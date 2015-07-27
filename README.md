# Matlab Multivariate Goodness of Fit Chi Test
This is a multivariate Goodness of Fit test. It can be applied to any sort of multivariate distribution, so long as you can find the cdf or ddf of its intersections.

## Repo
This repo contains two files:
+ *mcgoft.m*    : the function itself
+ *example.m* : a few examples

## The function
```{matlab}
function [ Results, ChiScore, O, E, bins ] = mcgoft( X, F, nBin, SUPWARN, SUPTEST)
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
    F = @(x) prod(cdf(pd,x),2);
```
#### Optional Inputs
- **nBin**: The number of bins that matlab will divide your dataset into. By default the number is *10*, which is useful for quick computations of large numbers of variable, but not very accurate.
- **SUPWARN**: suppress any messages or warnings. This should be a boolean.
- **SUPTEST**: suppress any tests. Please note that these tests are necessary checks that ensure you passed all the data correctly to the functions. However, suppressing this may cause an increase in computational time. This should be a boolean.

### Outputs
- **Results**: Bolean;   returns the results of test.
- **ChiScore**: Number;   chi-square-test score    
- **O**: Matrix;   The probability based off the Observed values
- **E**: Matrix;   The probability based off the Estimated values
- **bins**: Structure; all the bins with their values

