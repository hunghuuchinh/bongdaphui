class ChildPitchesController < ApplicationController
  def show
    @child_pitch = ChildPitch.find params[:id]
    @user = current_user
    @child_pitch_id = @child_pitch.id
    @searchs = @child_pitch.orders.search(params[:q])
    @orders = @searchs.result
    @pitch = @child_pitch.pitch
  end

end
