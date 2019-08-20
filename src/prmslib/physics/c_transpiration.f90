module PRMS_TRANSPIRATION
  use variableKind
  use prms_constants, only: sp, dp
  use ModelBase_class, only: ModelBase
  use Control_class, only: Control
  use PRMS_BASIN, only: Basin
  use PRMS_SET_TIME, only: Time_t
  use PRMS_TEMPERATURE, only: Temperature
  use prms_constants, only: dp
  implicit none

  private
  public :: Transpiration

  character(len=*), parameter :: MODDESC = 'Transpiration'
  character(len=*), parameter :: MODNAME = 'transpiration'
  character(len=*), parameter :: MODVERSION = '2018-08-30 13:51:00Z'

  type, extends(ModelBase) :: Transpiration
    ! integer(i32) :: basin_transp_on
    logical :: basin_transp_on

    logical, allocatable :: transp_on(:)
    ! integer(i32), allocatable :: transp_on(:)

  contains
    procedure, public :: init => init_Transpiration
    procedure, public :: run => run_Transpiration
  end type

  interface
    !! Transpiration constructor
    module subroutine init_Transpiration(this, ctl_data, model_basin, model_temp)
      class(Transpiration), intent(inout) :: this
        !! Transpiration class
      type(Control), intent(in) :: ctl_data
        !! Control file parameters
      type(Basin), intent(in) :: model_basin
        !! Model basin information
      class(Temperature), intent(in) :: model_temp
    end subroutine
  end interface

  interface
    module subroutine run_Transpiration(this, ctl_data, model_time, model_basin, model_temp)
      class(Transpiration), intent(inout) :: this
      type(Control), intent(in) :: ctl_data
      type(Time_t), intent(in) :: model_time
      type(Basin), intent(in) :: model_basin
      class(Temperature), intent(in) :: model_temp
    end subroutine
  end interface

end module
