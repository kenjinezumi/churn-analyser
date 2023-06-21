module CustomerModule
  use TimeSeriesModule
  implicit none
  
  private
  public :: Customer
  
  type :: Customer
    integer :: id
    type(TimeSeries) :: purchases
  end type Customer
  
  contains
  
    subroutine InitializeCustomer(cust, cust_id, input_data)
      type(Customer), intent(out) :: cust
      integer, intent(in) :: cust_id
      real, intent(in) :: input_data(:)
      
      cust%id = cust_id
      call Initialize(cust%purchases, input_data)
    end subroutine InitializeCustomer
    
end module CustomerModule
