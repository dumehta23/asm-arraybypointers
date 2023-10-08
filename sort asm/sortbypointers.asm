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
;  This file sorts the pointers of values in an array in ascending order.
;
;This file
;  File name: sortbypointers.asm
;  Language: X86-64
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l sortbypointers.lst -o sortbypointers.o sortbypointers.asm
;****************************************************************************************************************************


;****************************************************************************************************************************
; Start of program 

 
section .data
    array dq 0           ; Array to store pointers to doubles
    count dq 0           ; Variable to store the count of elements
    

section .text
    global sort_pointers

sort_pointers:

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
   
    mov rbp, rsp
    
    mov rsi, [rbp + 16]  ; Load the address of array[] into rsi
    mov rcx, [rbp + 24]  ; Load the value of count into rcx

    xor r8, r8           ; Initialize outer loop index i to 0
    
outer_loop:
    cmp r8, rcx          ; Compare outer loop index with count
    jge end_sort         ; If index >= count, exit the loop

    mov rdx, r8          ; Initialize min_index with the current index i
    mov rax, [rsi + r8*8] ; Load min pointer with array[i]
    
    mov rdi, r8          ; Initialize inner loop index j with i
    
inner_loop:
    cmp rdi, rcx          ; Compare inner loop index with count
    jge inner_loop_end    ; If index >= count, exit the inner loop

    mov r9, [rsi + rdi*8] ; Load pointer at array[j] into r9
    movq xmm0, [rax]      ; Load *min into xmm0
    movq xmm1, [r9]       ; Load *array[j] into xmm1
    ucomisd xmm0, xmm1     ; Compare *array[j] with *min

    jb update_min         ; If *array[j] < *min, update min pointer and min_index

update_min:
    mov rax, [rsi + rdi*8] ; Load pointer at array[j] into rax
    mov [rsi + rdx*8], rax ; Store *array[j] at array[i]
    mov rdx, rdi          ; Update min_index with the current index j

inner_loop_end:
    inc rdi               ; Increment inner loop index j
    jmp inner_loop        ; Jump to the beginning of the inner loop

end_sort:
    inc r8                ; Increment outer loop index i
    jmp outer_loop        ; Jump to the beginning of the outer loop

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
	                    
    ret			   ; Return from the function
    
; End of program	 
;****************************************************************************************************************************

