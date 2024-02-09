/* 
problem 2.7
Write a program in your favorite scripting language to remove comments
from programs in the calculator language (Example 2.9)

comment −→ /* ( non-* | * non-/ )* *+ /
| // ( non-newline )* newline

*/

#include <stdio.h>
#include <cstdlib>


int stringLength(char expr[]){
    int len = 0;
    while(expr[len] != '\0') len++;
    return len;
}

int commentNewlineEnd(char expr[], int start_index){
    int len = stringLength(expr);
    for (int index = start_index; index < len; index++){
        if (expr[index] == '\n'){
            return index - 1;
        }
    }
    return -1;
}

int commentStarSlashEnd(char expr[], int start_index){
    int len = stringLength(expr);
    for (int index = start_index; index < len; index++){
        if ((expr[index] == '*') && (index + 1 < len) && (expr[index + 1] == '/')){
            return index + 1;
        }
    }
    return -1;
}

void removeStringSection(char expr[], int index_start, int index_end){
    int len = stringLength(expr);
    if (index_start >= len) return;
    int length_remove = index_end - index_start + 1;

    for (int index = index_start; index < len; index++){
        if (index + length_remove < len){
            expr[index] = expr[index + length_remove];
        }else{
            expr[index] = '\0';
        }
    }
}

int removeComments(char expr[]){
    
    int comment_start = -1, comment_end = -1;
    int expr_length = stringLength(expr);

    for (int chr=0; ((chr < expr_length) && (expr[chr] != '\0')); chr++){
        if ((comment_start == -1) && (expr[chr] == '/')){
            comment_start = chr;

        }else if (comment_start != -1){
            if (expr[chr] == '/'){
                comment_end = commentNewlineEnd(expr, comment_start + 2);

                if (comment_end == -1) {
                    printf("Invalid comment expression: Newline expected\n");
                    std::exit(1);
                }
                removeStringSection(expr, comment_start, comment_end);
                comment_start = comment_end = -1;

            }else if (expr[chr] == '*'){
                comment_end = commentStarSlashEnd(expr, comment_start + 2);

                if (comment_end == -1){
                    printf("Invalid comment expression: Expected */ on end\n");
                    std::exit(1);
                }
                removeStringSection(expr, comment_start, comment_end);
                comment_start = comment_end = -1;
                
            }else{
                comment_start = -1;
            }
        }
    }
    return 1;
}


int main(int argv, char* argc[]){

    char expression[] = "var:=5+10 \t// addition\nvar:=10 -5 \t// subtraction\nvar:=4*3.5 \t/* multiplication */\nvar:=20/4 \t/* divsion \n\t\t\t  end exmaples*/";
    
    printf("Expression prior to removing comments\n\n");
    printf("%s\n", expression);

    removeComments(expression);

    printf("\nExpression after to removing comments\n\n");

    printf("%s\n", expression);

    return 0;

}
}
