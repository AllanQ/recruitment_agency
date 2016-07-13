class EmployeesController < ApplicationController

  def index

  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employees_url, notice: 'Работник создан'
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :salary, :contact, :search)
  end

end
