class SkillsController < ApplicationController

  def create
    # @vacancy = Vacancy.find(params[:vacancy_id])
    # @skills = Skill.add_skills_from_edit(@vacancy, name)
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
