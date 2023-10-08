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
//  Program name and Due Date: Array Sorting with Pointers / October 9, 2023 at 1:00am
//
//Purpose:
//  This file takes an array passed from an assembly function that contains float integers with pointers and derefrences them 
//  to print the numbers. 
//
//This file:
//  File name: output_array.c
//  Language: C
//  Assemble: gcc -c -Wall -o output_array.o -m64 -no-pie -fno-pie output_array.c
//****************************************************************************************************************************
 
 
//****************************************************************************************************************************
// Start of program 

#include <stdio.h>  // Include standard input/output library for printf function
#include <stdlib.h>  // Include standard library for malloc function

void sort_pointers(double* array[], int count);  // Declaration of the sort_pointers function

void output_array(double* array[], int count) 
{
    int counter = 0;  // Initialize a counter variable to 0 to iterate through the array
    while (counter < count)  // Loop until the counter reaches the size of the array
    {  	
        double value = *array[counter];  // Dereference the pointer to get the double value
        printf("%.8lf\n", value);  // Print the double value with 8 decimal places
        counter++;  // Increment the counter to move to the next element in the array
    } 
}

void output_sorted_array(double* array[], int count) 
{
    sort_pointers(array, count);  // Call sort_pointers function to sort the array of pointers
    int counter = 0;  // Initialize a counter variable to 0 to iterate through the sorted array
    while (counter < count)  // Loop until the counter reaches the size of the array
    {
        double value = *array[counter];  // Dereference the pointer to get the sorted double value
        printf("%.8lf\n", value);  // Print the sorted double value with 8 decimal places
        counter++;  // Increment the counter to move to the next element in the sorted array
    }
}

// End of program 
//****************************************************************************************************************************
 
