;***************************************************************************************************************************
;Program name: Array Sorting with Pointers. This program demonstrates how it creates an array of pointers to the objects and 
;sorts the pointers based on their values, enabling efficient sorting of large data sets. 
;
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as
;published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This 
;program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

;You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
;****************************************************************************************************************************

;****************************************************************************************************************************

;Author and Program information
;  Author name: Drashti Mehta
;  Author email: dumehta@csu.fullerton.edu
;  Class and Section: 240 Section 03 
;  Program name and Due Date: Array Sorting with Pointers / October 9, 2023 at 1:00am
; 
;Purpose
;  This file calls input and ouput functions and prints out all prompts. It also passes over an array to 
;  the C function.
;
;This file
;  File name: director.asm
;  Language: X86-64
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l director.lst -o director.o director.asm
;****************************************************************************************************************************


;****************************************************************************************************************************
; Start of program 

; External function declarations
extern input_array
extern output_array
extern printf
extern scanf
extern output_sorted_array


section .data

; All the prompts that needed to be printed 
    prompt_1 db "This program will sort all of your doubles.", 10, 0
    prompt_2 db 'Please enter floating numbers seperated by white space. After the last numberic input enter atleast one more white space and press control-d', 10, 0 
    prompt_newline db '', 10, 0
    prompt_3 db "Thank you. You entered these numbers", 10, 0    
    prompt_5 db 'End of output of array.', 10, 0
    prompt_6 db 'The array is now being sorted without moving any numbers.', 10, 0
    prompt_7 db 'The data in the array are now ordered as follows.', 10, 0   
    prompt_8 db 'End of output of array', 10, 0
    prompt_9 db 'The array willbe sent back to the caller function.', 10, 0
    
max_size equ 10

section .bss
    array resq 8        ; Define array to store floating-point numbers
    
section .text
    global director		; Declaring function

director:
 
;=========== Back up all the integer registers used in this program =======================================================
    pushf                ; Push flags register
    push rbx             ; Push rbx register
    push rcx             ; Push rcx register
    push rdx             ; Push rdx register
    push rsi             ; Push rsi register
    push rdi             ; Push rdi register
    push rbp             ; Push rbp register
    push r8              ; Push r8 register
    push r9              ; Push r9 register
    push r10             ; Push r10 register
    push r11             ; Push r11 register
    push r12             ; Push r12 register
    push r13             ; Push r13 register
    push r14             ; Push r14 register
    push r15             ; Push r15 register
     
   ; prompt message 1  
    mov rax, 0
    mov rdi, prompt_1
    call printf
        
    ; prompt message 2  
    mov rax, 0
    mov rdi, prompt_2
    call printf
          
    ;call input array to read and store numbers
    mov rax, 0
    mov rdi, array
    mov rsi, max_size
    call input_array
    
    ; moving rax register rbx 
    mov rbx, rax
        
    ;prompt newline
    mov rax, 0
    mov rdi, prompt_newline
    call printf
               
    ; prompt message 3 
    mov rax, 0
    mov rdi, prompt_3
    call printf
      
    ;call output array to print dereferenced array of pointers
    mov rax, 0
    mov rdi, array
    mov rsi, rbx
    call output_array
    
    ; prompt message 5 
    mov rax, 0
    mov rdi, prompt_5
    call printf
       
    ; prompt message 6 
    mov rax, 0
    mov rdi, prompt_6
    call printf
        
    ; prompt message 7
    mov rax, 0
    mov rdi, prompt_7
    call printf
    
    ;call output array to print sorted dereferenced array of pointers
    mov rax, 0
    mov rdi, array
    mov rsi, rbx
    call output_sorted_array
  
    ; prompt message 8 
    mov rax, 0
    mov rdi, prompt_8
    call printf
       
    ; prompt message 9 
    mov rax, 0
    mov rdi, prompt_9
    call printf
        
;=========== Now cleanup and return to the caller =========================================================================
  
	pop r15        ; Pop r15 register                            
	pop r14        ; Pop r14 register                        
	pop r13        ; Pop r13 register                         
	pop r12        ; Pop r12 register                           
	pop r11        ; Pop r11 register                           
	pop r10        ; Pop r10 register                             
	pop r9         ; Pop r9 register                             
	pop r8         ; Pop r8 register                           
	pop rbp		   ; Pop rbp register 
	pop rdi		   ; Pop rdi register 
	pop rsi		   ; Pop rsi register 
	pop rdx		   ; Pop rdx register 
	pop rcx		   ; Pop rcx register
	pop rax	       ; Pop rax register 
	popf		   ; Pop flags register 
  
    ; moving the final sorted array so that the main function can receive it and print it. 
    mov rax, array
    mov qword [rdi], rbx
                 
    ret				; Return from the function
    
; End of program	 
;****************************************************************************************************************************
