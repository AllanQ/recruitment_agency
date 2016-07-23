class VacanciesController < ApplicationController

  def index

  end

  def new
    @vacancy = Vacancy.new
    @skills = Skill.all
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    @vacancy.date = Time.now
    if @vacancy.save
      Skill.add_skills(@vacancy, all_params)
      redirect_to vacancies_url, notice: 'Вакансия создана'
    end
  end

  private

  def all_params
    params.require(:vacancy).permit(:title, :salary,
      :contacts, :validity, :skills)
  end

  def vacancy_params
    hash = all_params.to_h
    hash.delete(:skills)
    hash
  end
end
