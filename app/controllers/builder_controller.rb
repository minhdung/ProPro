class BuilderController < ApplicationController

  before_filter(:require_login)

  def index
  end

  def show
    @chart = Chart.find(params[:id])
    @sections_connections = sections_connections
  end

  def connections
    @chart = Chart.find(params[:id])
    @sections_connections = sections_connections
  end

  def show_chart_section
    @section = Section.find(params[:section_id])
    render :partial => 'builder/chart_section', :locals => { :section => @section }, :layout => false
  end

  private

  def sections_connections
    @chart.sections.each_with_object([]) do |sec, arr|
      sec.section_lines.map { |sl|
        pt = sl.propro_tool
        pt.onward_sections.each { |out_sec_id| arr << [sec.id, out_sec_id] }
      }
    end
  end

end
