class RetirementsController < ApplicationController
  def new
  end

  def create
    @user = current_user  # ← @userに代入
    if @user.destroy      # ← @user.destroyを呼ぶ（errorsが@userに入る）
      reset_session
      redirect_to root_path, notice: "退会完了しました"
    else
      respond_to do |format|
        format.turbo_stream
        format.html { render "retirements/new", status: :unprocessable_entity }
      end
    end
  end
end
