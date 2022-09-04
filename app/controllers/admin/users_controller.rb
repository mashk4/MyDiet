module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, except: %i[index create]

    def index
      respond_to do |format|
        format.html { @users = User.order(created_at: :desc) }

        format.zip { respond_with_zipped_users }
      end
    end

    def create
      if params[:archive].present?
        UserBulkService.call(params[:archive])
        flash[:success] = "Users imported!"
      end

      redirect_to admin_users_path
    end

    def edit; end

    def update
      if @user.update(user_params)
        flash[:success] = "User updated!"
        redirect_to admin_users_path
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      flash[:success] = "User deleted!"
      redirect_to admin_users_path
    end

    private

    def find_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :role)
    end

    def respond_with_zipped_users
      compressed_filestream = Zip::OutputStream.write_buffer do |zos|
        User.order(created_at: :desc).each do |user|
          zos.put_next_entry "user_#{user.id}.xlsx"
          zos.print render_to_string(
            layout: false, handlers: [:axlsx], formats: [:xlsx],
            template: 'admin/users/user',
            locals: { user: user }
          )
        end
      end

      compressed_filestream.rewind
      send_data(compressed_filestream.read, filename: 'users.zip')
    end
  end
end
