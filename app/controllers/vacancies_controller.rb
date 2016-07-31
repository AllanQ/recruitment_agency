class VacanciesController < ApplicationController

  def index
    @vacancies = Vacancy.all.order(created_at: :desc).page(params[:page])
      .per(params[:per])
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def new
    @vacancy = Vacancy.new
    @skills = Skill.all
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.date = Time.now
    if @vacancy.save
      Skill.add_skills_from_new(@vacancy, all_params)
      redirect_to vacancies_path, notice: 'Вакансия создана'
    else
      render 'new'
    end
  end

  def edit
    @vacancy = Vacancy.find(params[:id])
    @skill = Skill.new
    @skills = @vacancy.skills
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    @vacancy.date = Time.now
    if @vacancy.update(vacancy_params)
      redirect_to @vacancy, notice: 'Вакансия обновлена'
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def all_params
    params.require(:vacancy).permit(:title, :salary, :contacts, :validity,
      :skills)
  end

  def vacancy_params
    hash = all_params.to_h
    hash.delete(:skills)
    hash
  end
end
