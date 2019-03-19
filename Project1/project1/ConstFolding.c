

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
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


//________________________________________________________________________________________________________________________________________________


	Instruction *ptr = head;
	ptr = ptr->next;
	for(; ptr != NULL; ptr = ptr->next){//start for loop
	  

	  if(ptr->opcode == LOADI && ptr->next->opcode == LOADI){
	    if(ptr->next->next->opcode == ADD || ptr->next->next->opcode == SUB || ptr->next->next->opcode == MUL){//OPERATION CHECK
	      int ans;
	      if(ptr->next->next->opcode == ADD){//ADDITION
		ans = (ptr->field1) + (ptr->next->field1);
	      }else if(ptr->next->next->opcode == SUB){//SUBTRACTION
		ans = (ptr->field1) - (ptr->next->field1);
	      }else{//MULTIPLICATION
		ans = (ptr->field1) * (ptr->next->field1);
	      }
	    

	      Instruction *aft = ptr->next->next->next;
	      int regNum = aft->prev->field3;
	      //we now have to computed opertion answer and the register number where it was stored with: ans & regNum 
	      ptr->field1 = ans; ptr->field2 = regNum;
	      //save the 2 instructions to delete
	      Instruction *two = ptr->next;
	      Instruction *three = ptr->next->next;
	      //set current instruction to point to after the operation command and have that instruction point back to the new instruction
	      ptr->next = aft; aft->prev = ptr;
	      //clear nodes 2 and 3 & aft
	      two->prev = NULL; two->next = NULL;
	      three->prev = NULL; three->next = NULL;
	      free(two); free(three);
	      while(aft != NULL){ aft = aft->next; }
	      free(aft);
	    }
	  }


	}

	
	free(ptr);
	

//________________________________________________________________________________________________________________________________________________
	if (head) 
		PrintInstructionList(stdout, head);
	
	DestroyInstructionList(head);
	
	return EXIT_SUCCESS;
}

