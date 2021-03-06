class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  # GET /projects
  # GET /projects.json
  def index
    load_projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project ||= Project.find(params[:id])
    @card ||= Card.new
    @remote = true
    @project_id = @project.id
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = current_user.projects.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_user.projects.new params[:project]
    @project.actions.new activity: "#{current_user.name} created Project named #{@project.name}"
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'New project created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    name = @project.name

    save = @project.update_attributes(params[:project])
    @project.actions.new activity: "#{current_user.name} changed #{name} to #{@project.name}"

    respond_to do |format|
      if save && @project.save
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def leave_project
    Project.find(params[:id]).collaborators.delete(current_user)
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
