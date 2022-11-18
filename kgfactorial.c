/*****Assignment1*****/
/*****kgfactorial.c*****/

/*****Header files*****/
#include <stdio.h>
#include <stdint.h>
#include <ctype.h>

#include "common.h"

uint32_t x;
int kgfactorial( uint32_t x );

ParserReturnVal_t CmdTestt(int action)
{

  if(action==CMD_SHORT_HELP) return CmdReturnOk;
  if(action==CMD_LONG_HELP) {
    printf("testasm\n\n"
	   "This command tests the C to assembler interface\n"
	   );

    return CmdReturnOk;
  }
  fetch_uint32_arg(&x); //it will take the input value
  printf("factorial = %u\n", kgfactorial(x)); //it will print the factorial value

  return CmdReturnOk;
}

ADD_CMD("fact",CmdTestt,"Test") //command "fact"
