class ProfilesController < ApplicationController
before_action :authenticate_user!

  def new
    @profile = Profile.new
  end



    def create
    session[:nickname] = profile_params[:nickname]
    session[:date_of_birth] = profile_params[:date_of_birth]
    session[:gender_id] = profile_params[:gender_id]
    session[:address_id] = profile_params[:address_id]
    session[:personality_id] = profile_params[:personality_id]
    session[:special_skill_id] = profile_params[:special_skill_id]
    session[:introduce] = profile_params[:introduce]

    @profile = Profile.new(
    nickname: session[:nickname],
    date_of_birth: session[:date_of_birth],
    gender_id: session[:gender_id],
    address_id: session[:address_id],
    personality_id: profile_params[:personality_id],
    special_skill_id: profile_params[:special_skill_id],
    introduce: profile_params[:introduce]
    )

    if @profile.save
      session[:id] = @profile.id
      redirect_to profiles_path(@profile), notice: "プロフィールを登録しました。"
    else
      render :new
    end
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
    params.require(:profile).permit(:nickname, :date_of_birth, :gender_id, :address_id, :personality_id, :special_skill_id, :introduce)
  end


end
