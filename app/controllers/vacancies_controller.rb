class VacanciesController < ApplicationController

  def index

  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to vacancies_url, notice: 'Вакансия создана'
    end
  end

  private

  def vacancy_params
    params.require(:vacancy).permit(:title, :salary, :contacts, :validity)
  end
end