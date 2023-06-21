module TimeSeriesModule
  implicit none
  
  private
  public :: TimeSeries
  
  type :: TimeSeries
    real, allocatable :: data(:)
    integer :: length
  end type TimeSeries
  
  contains
    
    subroutine Initialize(ts, input_data)
      type(TimeSeries), intent(out) :: ts
      real, intent(in) :: input_data(:)
      
      ts%length = size(input_data)
      allocate(ts%data(ts%length))
      ts%data = input_data
    end subroutine Initialize
    
    function Mean(ts) result(mean_val)
      type(TimeSeries), intent(in) :: ts
      real :: mean_val
      
      mean_val = sum(ts%data) / real(ts%length)
    end function Mean
    
    function StandardDeviation(ts) result(std_dev)
      type(TimeSeries), intent(in) :: ts
      real :: std_dev
      real :: mean_val
      
      mean_val = Mean(ts)
      std_dev = sqrt(sum((ts%data - mean_val)**2) / real(ts%length))
    end function StandardDeviation
    
end module TimeSeriesModule
