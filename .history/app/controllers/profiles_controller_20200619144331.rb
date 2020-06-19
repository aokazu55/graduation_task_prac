class Profile_idController < ApplicationController
# before_action :authenticate_user!, except: [:index]

  def new
    @profile_id = Profile_id.new
  end

  def create
    @profile_id = current_user.profile_ids.build(profile_id_params)
    if @profile_id.save
      redirect_to profile_id_path(@profile_id), notice: "レシピを投稿しました。"
    else
      render :new
    end
  end

  def index
    @profile_ids = profile_id.all.order([:id])
  end

  def show
    @profile_id = profile_id.find(params[:id])
  end

  def edit
    @profile_id = profile_id.find(params[:id])
    if @profile_id.user != current_user
        redirect_to profile_ids_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @profile_id = profile_id.find(params[:id])
    if @profile_id.update(profile_id_params)
      redirect_to profile_id_path(@profile_id), notice: "サービスを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    profile_id = profile_id.find(params[:id])
    profile_id.destroy
    redirect_to user_path(profile_id.user), notice: "サービスを削除しました。"
  end

  private

  def profile_id_params
    params.require(:profile_id).permit(:nickname, :date_of_birth, :gender_id, :address_id, :personality_id, :special_skill_id, :introduce)
  end


end
