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
;  This file demonstrates how it takes in user inputs of float numbers from the user. 
;
;This file
;  File name: input_array.asm
;  Language: X86-64
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l input_array.lst -o input_array.o input_array.asm
;****************************************************************************************************************************

; External function declarations
extern printf
extern scanf
extern malloc

section .data
    format_in db "%lf", 0  ; Format specifier for reading a double

section .text
    global input_array     ; Declaring function

input_array:

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
    
    mov r14, rdi         ; Store the address of the array in r14
    mov r15, rsi         ; Store the max_size in r15  
    mov r13, 0           ; Initialize a counter (r13) to zero
    
begin:
     
    cmp r13, r15         ; Compare the counter to the max_size
    je done              ; If they are equal, we are done with input
    
    ; Allocate memory for the float value
    mov rdi, 8           ; 8 bytes is the size of a pointer
    call malloc          ; Call malloc to allocate the memory
    mov r12, rax         ; Store the allocated memory address into r12
    
    ; Read a floating-point number from the user into the current array element
    mov rax, 0
    mov rdi, format_in   ; Load the format specifier for scanf
    mov rsi, r12         ; Load the address of memory into rsi
    call scanf           ; Call the scanf function
    
    cdqe                  ; Sign-extend rax to the size of rdi (quadword)
    cmp rax, -1           ; Check if scanf failed to convert (likely due to Ctrl-D)
    je done               ; If so, we are done
    
    mov [r14+r13*8], r12  ; Store the pointer in the current array element
    inc r13               ; Increment the counter
    jmp begin             ; Continue reading the next value
     
done:
   
    ; Number of values entered in rax
    mov rax, r13
 	  
;=========== Now cleanup and return to the caller =========================================================================
    
    pop r15               ; Pop r15 register
    pop r14               ; Pop r14 register
    pop r13               ; Pop r13 register
    pop r12               ; Pop r12 register
    pop r11               ; Pop r11 register
    pop r10               ; Pop r10 register
    pop r9                ; Pop r9 register
    pop r8                ; Pop r8 register
    pop rbp               ; Pop rbp register
    pop rdi               ; Pop rdi register
    pop rsi               ; Pop rsi register
    pop rdx               ; Pop rdx register
    pop rcx               ; Pop rcx register
    pop rbx               ; Pop rbx register
    popf                  ; Pop flags register
    
    ret                   ; Return from the function

; End of program	 ; Return from the function
;****************************************************************************************************************************

