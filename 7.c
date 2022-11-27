#include <stdio.h>
#include <stdlib.h>

 
double f_e(double x) {
    double f_x = 1;
    int n = 100;
    double p = x;
    double f = 1;
    for (int i = 1; i < n ; ++i) {
        if (i  % 2 != 0) {
            f_x -= (p/f);
            
        } else {
            f_x += (p/f);
        }
        p *= x;
        f *= i+1;
    }
    return f_x;
}


int main(int argc, char *argv[]){
  if(argc != 3){
      printf("Wrong input\n");
      return 0;
    }
    FILE *input = fopen(argv[1], "r");
    FILE *out = fopen(argv[2], "w");
    if((input == NULL) || (out == NULL)){
      printf("Wrong file\n");
      return 0;
    }
  double x;
  fscanf(input,"%lf", &x);
  if(x > 21){
      printf("too small result\n");
      return 0;
  }
  double fx = f_e(x);
  fprintf(out, "%.9lf", fx);
  fclose(input);
  fclose(out);
  return 0;
}
