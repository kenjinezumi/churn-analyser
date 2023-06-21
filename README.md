# Customer Churn Analysis Fortran Application

This Fortran application performs customer churn analysis based on time series data stored in a CSV file. It calculates the churn rate by analyzing the behavior of customers over time, considering factors such as new customers, frequency of existing customers, and churned customers.

## Prerequisites

- Fortran compiler (e.g., gfortran, ifort)
- fintrcsv

## Usage

1. Clone the repository or download the source code files.

2. Open a terminal or command prompt and navigate to the directory where the Fortran files are located.

3. Compile the Fortran files using the appropriate compiler command. Modify the command based on the compiler you are using. Example commands:
   - For GNU Fortran (gfortran):
     ```
     gfortran -o customer_churn main_program.f90 timeseries_module.f90 customer_module.f90 churn_module.f90
     ```
   - For Intel Fortran (ifort):
     ```
     ifort -o customer_churn main_program.f90 timeseries_module.f90 customer_module.f90 churn_module.f90
     ```

4. Run the executable file using the appropriate command. Example commands:
   - On Linux/macOS:
     ```
     ./customer_churn
     ```
   - On Windows:
     ```
     customer_churn.exe
     ```

5. The program will prompt you to enter the filename of the CSV file. Provide the filename, including the file extension, and press Enter.

6. The program will process the data from the CSV file and display the churn rate.

## CSV File Format

The CSV file should have the following format:

- Each row represents a time point.
- The first row contains headers or labels for the customer columns.
- Each subsequent row contains the numeric data for each customer at a specific time point.

Example CSV file:
     
```
Customer1, Customer2, Customer3
Time1, 1.2, 0.8, 0.5
Time2, 2.3, 1.5, 1.0
Time3, 1.8, 1.2, 0.7     
```
