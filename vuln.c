#include <stdio.h>
#include <string.h>

void unsafe_function(char *input) 
{
    char buffer[16];
    strcpy(buffer, input);  // No bounds check, leads to buffer overflow
    printf("You entered: %s\n", buffer);
}

int main() {
    char user_input[256];
    printf("Enter some text: ");
    fgets(user_input, 256, stdin);
    user_input[strcspn(user_input, "\n")] = 0;  
    unsafe_function(user_input);
    return 0;
}