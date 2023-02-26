#include <stdio.h>

int main(){
  system("git add .");
  system("git commit -m \"a\"");
  system("git push");
  return 0;
}