program CustomerChurn
  use ChurnModule
  use fintrcsv_module
  implicit none
  
  type(ChurnAnalyzer) :: churnAnalyzer
  real, allocatable :: inputData(:,:)
  real :: churn
  
  character(len=1024) :: csvFilename
  integer(c_int), parameter :: MAX_STRING_LEN = 1024
  integer(c_int) :: numCustomers, numTimePoints, i, j, status
  
  ! Read the filename of the CSV file from the user
  !ADD THE FILENAME
  write(*,*) 'Enter the filename of the CSV file:'
  read(*, '(a)') trim(csvFilename)
  
  ! Read the CSV file
  call read_csv_file(trim(csvFilename), inputData, numTimePoints, numCustomers)
  
  ! Call the initialization subroutine
  call churnAnalyzer%Initialize(numCustomers, inputData)
  
  ! Calculate churn
  churn = churnAnalyzer%CalculateChurn()
  
  ! Display the churn rate
  write(*,*) 'Churn rate:', churn
  
  ! Deallocate memory
  deallocate(inputData)
  
end program CustomerChurn
