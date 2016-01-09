#include <stdio.h>

int main(int argc, char *argv[])
{
  int i = 0;

  // go through each string in argv
<<<<<<< HEAD
  // why am I skipping argv[0]
  for(i = 1; i < argc; i++){
    printf("arg %d: %s\n", i, argv[i]);
  }

  // let's make our own array of strings
=======
  //. why am I skipping argv[0]?
  for(i = 1; i < argc; i++) {
    printf("arg %d: %s\n", i, argv[i]);
  }

  // let's ake our own array of strings
>>>>>>> 92d94c0cdd4d1ef04e7c346079d69a47b9c1e824
  char *states[] = {
    "California", "Oregon",
    "Washington", "Texas"
  };
  int num_states = 4;

<<<<<<< HEAD
  for(i = 0; i < num_states; i++){
    printf("state %d: %s\n", i, states[i]);
  }
=======
  for(i = 0; i < num_states; i++) {
    printf("state %d: %s\n", i, states[i]);
  };
>>>>>>> 92d94c0cdd4d1ef04e7c346079d69a47b9c1e824

  return 0;
}
