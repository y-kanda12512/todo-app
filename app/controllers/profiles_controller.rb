class ProfilesController < ApplicationController
    # サインインしている場合のみプロフィールに関するアクションが実行できる
    before_action :authenticate_user!

    def edit
        @profile = current_user.prepare_profile
    end

    def update
        @profile = current_user.build_profile(profile_params)
        if @profile.save
            redirect_to root_path,notice: 'プロフィールを更新しました'
        else
            flash.now[:error] = '写真を選択してください'
            render :edit
        end
    end

    private
    def profile_params
        params.require(:profile).permit(
            :avatar
        )
    end
end