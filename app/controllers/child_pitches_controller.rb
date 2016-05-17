class ChildPitchesController < ApplicationController
  def show
    @child_pitch = ChildPitch.find params[:id]
    @user = current_user
    @child_pitch_id = @child_pitch.id
  end
end
