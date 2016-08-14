class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]
	def index
		@projects = Project.all.order("created_at desc").
					paginate(page: params[:page], per_page: 3)
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new project_params
		if @project.save
			redirect_to @project, notice: "Project successfully saved!"
		else
			render 'new', notice: "Project save failed!"
		end
	end

	def update
		if @project.update project_params
			redirect_to @project, notice: "Project successfully updated!"
		else
			render 'edit', notice: "Project save failed!"
		end
	end

	def destroy
		if @project.destroy
			redirect_to projects_path
		else
			render 'show'
		end
	end

	private
		def project_params
			params.require(:project).permit(:title, :description, :link, :slug)
		end

		def find_project
			@project = Project.friendly.find(params[:id])
		end
end
