#include <stdio.h>

/* This is a comment. */
int main(int argc, char *argv[])
{
  int distance = 100;

  // this is also a comment
  printf("You are %d miles away.\n", distance);

  /* This wasn't in the exercise, but I wanted to
     test that I understood this correctly. I'm sure the
     author woldn't mind ;). */
  printf("Exe name: %s  | first arg: %s\n", argv[0], argv[1]);     

  return 0;
}
