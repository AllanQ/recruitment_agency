class EmployeesController < ApplicationController

  def index
    @employees = Employee.all.order(created_at: :desc).page(params[:page])
      .per(params[:per])
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
    @skills = Skill.all
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      Skill.add_skills_from_new(@employee, all_params)
      redirect_to employees_path, notice: 'Работник создан'
    else
      render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    @skill = Skill.new
    @skills = @employee.skills
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      redirect_to @employee, notice: 'Работник обновлён'
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def all_params
    params.require(:vacancy).permit(:name, :contact, :search, :salary, :skills)
  end

  def employee_params
    hash = all_params.to_h
    hash.delete(:skills)
    hash
  end
end
