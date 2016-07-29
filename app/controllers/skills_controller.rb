class SkillsController < ApplicationController

  def create

  end

  def find_id
    skill_id = 0
    skill = Skill.find_by(name: skill_name)
    skill_id = skill.id if skill
    render json: { 'id': skill_id }
  end

  private

  def skill_name
    params.require(:skill).permit(:name).to_h[:name]
  end

end
