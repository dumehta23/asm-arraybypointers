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
//  This file takes an array of values with pointers and swaps the pointers to each value to sort them in ascending order.
//
//This file:
//  File name: sortpointers.c
//  Language: C
//  Assemble: gcc -c -Wall -o sortpointers.o -m64 -no-pie -fno-pie sortpointers.c
//****************************************************************************************************************************
 
 
//****************************************************************************************************************************
// Start of program 

#include <stdio.h>  // Include standard input/output library for printf function
#include <stdlib.h>  // Include standard library for malloc function

// Function to sort an array of pointers to doubles in ascending order using selection sort algorithm
void sort_pointers(double* array[], int count) 
{
    for (int i = 0; i < count; i++)  // Iterate through the array elements
    {    	
    	double* min = array[i];  // Initialize min pointer with the current element
    	int min_index = i;  // Initialize min_index with the current index
    	
    	for (int j = i; j < count; j++)  // Iterate through the remaining elements
    	{    		
    		if (*array[j] < *min)  // Compare the values pointed by the current and min pointers
    		{    		
    			min = array[j];  // Update min pointer if a smaller element is found   			
    			min_index =  j;  // Update min_index with the index of the smaller element   			
    		}    		
    	}    
    	
    	double* temp = array[i];  // Store the current element in a temporary pointer
    	array[i] = min;  // Assign the smaller element to the current position
    	array[min_index] = temp;  // Place the current element in the position of the smaller element
    }
}


// End of program 
//****************************************************************************************************************************
