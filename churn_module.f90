module ChurnModule
  use CustomerModule, TimeSeriesModule
  implicit none
  
  private
  public :: ChurnAnalyzer
  
  type :: ChurnAnalyzer
    type(Customer), allocatable :: customers(:)
    integer :: numCustomers
  end type ChurnAnalyzer
  
  contains
  
    subroutine Initialize(churnAnalyzer, num_customers, input_data)
      type(ChurnAnalyzer), intent(out) :: churnAnalyzer
      integer, intent(in) :: num_customers
      real, intent(in) :: input_data(:,:)
      
      integer :: i
      allocate(churnAnalyzer%customers(num_customers))
      
      churnAnalyzer%numCustomers = num_customers
      do i = 1, num_customers
        call InitializeCustomer(churnAnalyzer%customers(i), i, input_data(:,i))
      end do
    end subroutine Initialize
    
    function CalculateChurn(churnAnalyzer) result(churn)
      type(ChurnAnalyzer), intent(in) :: churnAnalyzer
      real :: churn
      
      real :: mean_value, std_dev
      real, allocatable :: diff(:)
      integer :: i, j
      
      allocate(diff(churnAnalyzer%numCustomers))
      
      churn = 0.0
      do i = 1, churnAnalyzer%numCustomers
        mean_value = Mean(churnAnalyzer%customers(i)%purchases)
        std_dev = StandardDeviation(churnAnalyzer%customers(i)%purchases)
        
        diff = churnAnalyzer%customers(i)%purchases%data - mean_value
        
        do j = 1, churnAnalyzer%customers(i)%purchases%length
          if (diff(j) < -2.0 * std_dev) then
            churn = churn + 1.0
            exit
          end if
        end do
        
      end do
      
      churn = churn / real(churnAnalyzer%numCustomers)
      
    end function CalculateChurn
    
end module ChurnModule
