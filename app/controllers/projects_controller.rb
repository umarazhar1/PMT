class ProjectsController < ApplicationController
    before_action :set_project, only: [:show, :edit, :update, :destroy]
		before_action :require_user, except: [:show, :index]
		before_action :require_same_user, only: [:edit, :update, :destroy]
		before_action :authorize_manager, only: [:new, :create]


		def show
        # debugger
				# binding.break # Call to debugger
    end

    def index
        @projects = Project.paginate(page: params[:page], per_page: 5)
    end

    def new
			@project = Project.new
    end

		def edit
		end

    def create
        @project = Project.new(project_params)
				# @project.user = User.first    #added temporarily
				@project.user = current_user
        if @project.save
					flash[:notice] = "Project was created successfully!"
        	redirect_to project_path(@project)
				else
					flash[:notice] = "Failed to create project!"
					#render 'new'
					render 'new', status: :unprocessable_entity
				end
        #render plain: @project.inspect
    end

		def update
			if @project.update(project_params)
				flash[:notice] = "Project was updated successfully!"
				redirect_to project_path(@project)
			else
				flash[:notice] = "Failed to update the project!"
				render 'edit', status: :unprocessable_entity
			end
		end

		def destroy
			@project.destroy
			redirect_to projects_path
		end

		# def destroy_a
		# 	project = Project.find_by(id: params[:id])
		# 	project.destroy
		# 	redirect_to projects_path
		# end


		



		private
		def set_project
			@project = Project.find(params[:id])
		end

		def project_params
			params.require(:project).permit(:title, :description)
		end

		def require_same_user
			if current_user != @project.user && !current_user.admin?
				flash[:alert] = "You can only edit or delete your own project, or the manager have this access"
				redirect_to @project
			end
		end

		def authorize_manager
			redirect_to root_path, alert: 'Only managers can create projects.' unless current_user.manager?
		end

end
