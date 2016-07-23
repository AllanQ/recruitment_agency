class EmployeesController < ApplicationController

  def index

  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      Skill.add_skills(@employee, all_params)
      redirect_to employees_url, notice: 'Работник создан'
    end
  end

  private

  def all_params
    params.require(:employee).permit(:name, :salary, :contact, :search, :skills)
  end

  def employee_params
    hash = all_params.to_h
    hash.delete(:skills)
    hash
  end
end
