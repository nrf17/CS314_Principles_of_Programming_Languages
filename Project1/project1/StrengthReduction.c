

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "InstrUtils.h"
#include "Utils.h"

int main()
{
	Instruction *head;

	

	head = ReadInstructionList(stdin);

	if(!head){ head = ReadInstructionList(stdout); }



	if (!head) {
		WARNING("No instructions\n");
		exit(EXIT_FAILURE);
	}


//_______________________________________________________________________________________________________________________________________________

	Instruction *ptr = head;
	ptr = ptr->next;
	
	for(; ptr != NULL; ptr = ptr->next){
	  
	  if(ptr->opcode == LOADI){
	    if(ptr->next->opcode == MUL || ptr->next->opcode == DIV){
	      
	      //check ptr field1 is a power of 2
	      int temp = ptr->field1;
	      int boolean = 1;
	      int power = 0;
	      if (temp < 1){ boolean = 0; }
	      else{
		while (temp != 1){
		  if (temp%2 != 0){ boolean = 0; break; }
		  temp = temp/2;
		  power++;
		}
	      }//ends power 2 check
	      



	      if(boolean == 0){ continue; }//number wasnt a power of 2, ignore it can keep going thru the list
	      
	      else{//number was a power of two, makes changes to the list

		ptr->field1 = ptr->next->field1;
		ptr->field2 = power;
		ptr->field3 = ptr->next->field3;
		if(ptr->next->opcode == MUL){ ptr->opcode = LSHIFTI; }
		else{ ptr->opcode = RSHIFTI; }

		Instruction *bye = ptr->next;
		ptr->next = bye->next;
		bye->next->prev = ptr;
		
		bye->next = NULL;
		bye->prev = NULL;
		free(bye);

	      }//ends changing instruction list
	      






	    }//ends Operation check
	  }//ends LOADI check

	}//ends for loop


	free(ptr);
//_______________________________________________________________________________________________________________________________________________
	if (head) 
		PrintInstructionList(stdout, head);
	
	DestroyInstructionList(head);
	
	return EXIT_SUCCESS;
}

