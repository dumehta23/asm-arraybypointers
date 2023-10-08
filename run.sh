#!/bin/bash

#***************************************************************************************************************************
#Program name: Array Sorting with Pointers. This program demonstrates how it creates an array of pointers to the objects and 
#sorts the pointers based on their values, enabling efficient sorting of large data sets. 

#This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as
#published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This 
#program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

#You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org l
#licenses/>.
#****************************************************************************************************************************

#****************************************************************************************************************************
#Author and Program information
#  Author name: Drashti Mehta
#  Author email: dumehta@csu.fullerton.edu
#  Class and Section: 240 Section 03 
#  Program name and Due Date: Array Sorting with Pointers / October 9, 2023 at 1:00am
 
#Purpose:
# This file complies all of the files needed in this program and also complies the program. This is file that is ran in the
# terminal in order to execute the program.

#This file:
# File name: run.sh
#****************************************************************************************************************************


echo "This is program <Array Sorting with Pointers>"

echo "Assembling asm files"
nasm -f elf64 -l director.lst -o director.o director.asm
nasm -f elf64 -l input_array.lst -o input_array.o input_array.asm
 
echo "Compiling c files"
gcc -c -Wall -o output_array.o -m64 -no-pie -fno-pie output_array.c
gcc -c -Wall -o main.o -m64 -no-pie -fno-pie main.c
gcc -c -Wall -o sortpointers.o -m64 -no-pie -fno-pie sortpointers.c

echo "Linking the object files"
gcc -m64 -no-pie -o final input_array.o output_array.o sortpointers.o director.o main.o

echo "Running the program"
./final

echo "The bash script is now closing."

