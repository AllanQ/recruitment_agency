class VacanciesController < ApplicationController

  def index
    @vacancies = Vacancy.all
                        .order(created_at: :desc)
                        .page(params[:page])
                        .per(params[:per])
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
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
    # respond_to do |format|
    #   format.js
    #   format.html
    # end
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end

  def edit
    @vacancy = Vacancy.find(params[:id])
    @skills = @vacancy.skills
      .inject(''){ |skills, skill| "#{skills}, #{skill.name}=#{skill.id}" }
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
