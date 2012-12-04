class SectionLinesController < ApplicationController
  before_filter(:require_login)

  respond_to :html, :json

  def index
    @section_lines = SectionLine.all
    render "index"
  end

  def show
    @section_line = SectionLine.find(params[:id])
    respond_with do |format|
      format.html { render "show", :layout => false }
      format.json { render "show" }
    end
  end

  def create
    section = @current_user.user_group.sections.find(params[:section_id])
    @section_line = section.section_lines.new( tool_id: params[:tool_id] )
    @section_line.save
    respond_with do |format|
      format.html { render "show", :layout => false }
      format.json { render "show" }
    end
  end

  def update
  end

  def destroy
    @section_line = SectionLine.find(params[:id])
    @section_line.destroy
    render json: nil, status: :ok
  end

end
