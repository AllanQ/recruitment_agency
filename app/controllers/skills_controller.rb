class SkillsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def add
    @vacancy = Vacancy.find(params[:vacancy_id])
    @skills = Skill.add_skills_from_edit(@vacancy, name)
    respond_to :js
  end

  def find_id
    skill = Skill.find_by(name: name)
    id = skill ? skill.id : 0
    render json: { 'id': id }
  end

  private

  def name
    params.require(:skill).permit(:name).to_h[:name]
  end
end
