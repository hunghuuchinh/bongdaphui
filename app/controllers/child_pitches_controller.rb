class ChildPitchesController < ApplicationController
  def show
    @child_pitch = ChildPitch.find params[:id]
  end
end
