/*****Assignment2*****/
/*****kgcomp.c*****/

/*****Header files*****/
#include <stdio.h>
#include <stdint.h>
#include <ctype.h>

#include "common.h"

int32_t A, B;
int KG_AFC( int32_t A, int32_t B);

ParserReturnVal_t CmdComp(int action)
{

  if(action==CMD_SHORT_HELP) return CmdReturnOk;
  if(action==CMD_LONG_HELP) {
    printf("testasm\n\n"
	   "This command tests the C to assembler interface\n"
	   );

    return CmdReturnOk;
  }
  fetch_int32_arg(&A); //it will take the input A
  fetch_int32_arg(&B); //it will take the input B
  KG_AFC(A, B);

  return CmdReturnOk;
}

ADD_CMD("Compare",CmdComp,"Test Command Compare") //command "Compare"
