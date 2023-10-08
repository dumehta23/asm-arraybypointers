//***************************************************************************************************************************
//Program name: Array Sorting with Pointers. This program demonstrates how it creates an array of pointers to the objects and 
//sorts the pointers based on their values, enabling efficient sorting of large data sets. 
//
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as
//published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version. This 
//program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License along with this program.  If not, see <https://www.gnu.org/licenses/>.
//****************************************************************************************************************************

//****************************************************************************************************************************
//Author and Program information
//  Author name: Drashti Mehta
//  Author email: dumehta@csu.fullerton.edu
//  Class and Section: 240 Section 03 
//  Program name and Due Date: Array Sorting with Pointers /October 9, 2023 at 1:00am
//
//Purpose:
//  This file takes an array passed from an assembly function that contains sorted float integers and outputs it.
//
//This file:
//  File name: main.c
//  Language: C
//  Assemble: gcc -c -Wall -o main.o -m64 -no-pie -fno-pie main.c
//****************************************************************************************************************************


//****************************************************************************************************************************
// Start of program 

#include <stdio.h>  // Include standard input/output library for printf function

extern double** director(unsigned long* n); // External function declaration for the director function

int main() 
{
    unsigned long size = 0;  // Declare a variable to store the size of the received array, initialize to 0
    printf("\nWelcome to a great program developed by Drashti Mehta.\n");  // Print a welcome message to the console
    double** array = director(&size);  // Declare a double pointer variable to store the received array   
    printf("The main function received this set of numbers: \n");  // Print a message indicating the following output
    
    // Iterate through the received array and print each element with 2 decimal places
    for (int i = 0; i < size; i++)
    {
        printf("%.2lf\n", *array[i]);  // Print each element of the received array with 2 decimal places
    }       
    printf("Main will keep these and send a zero to the operating system.\n");  // Print a message indicating program behavior    
    return 0;  // Exit the program, returning 0 to the operating system
}

// End of program 
//****************************************************************************************************************************

