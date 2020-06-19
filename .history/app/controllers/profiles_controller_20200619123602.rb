class ProfilesController < ApplicationController
before_action :authenticate_user!, except: [:index]

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.profiles.build(profile_params)
    if @profile.save
      redirect_to profile_path(@profile), notice: "レシピを投稿しました。"
    else
      render :new
    end
  end

  def index
    @profiles = profile.all.order([:id])
  end

  def show
    @profile = profile.find(params[:id])
  end

  def edit
    @profile = profile.find(params[:id])
    if @profile.user != current_user
        redirect_to profiles_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @profile = profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), notice: "サービスを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    profile = profile.find(params[:id])
    profile.destroy
    redirect_to user_path(profile.user), notice: "サービスを削除しました。"
  end

  private

  def profile_params
    params.require(:profile).permit(:nickname, :date_of_birth, :gender, :address, :personality, :special_skills, :introduce)
  end


end
