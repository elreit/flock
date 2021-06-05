class WalksController < ApplicationController
  def create
    @walk = Walk.new(walk_params)
    @walk.pin = Faker::Code.nric
    @walk.user_destination_id = Destination.where(user_id: current_user.id).last.id
    if @walk.save
      redirect_to dashboard_path(current_user.id)
    end
  end

  def update
    @walk = Walk.find()
    @walk.walk_accepted = true
    @walk.save
  end

  private

  def walk_params
    params.require(:walk).permit(:meeting_point, :buddy_destination_id)
  end
end


def update
   @appointment = Appointment.find(params[:id])
   @appointment.status = params[:format]
   @appointment.save
   redirect_to granny_path(@appointment.granny), notice: "Status updated to #{@appointment.status}"
 end

 <div>
  <p class="button"><%= link_to 'confirm', appointment_path(appointment, format: 'confirm'), method: 'PATCH' %></p>
  <p class="button"><%= link_to 'decline', appointment_path(appointment, format: 'decline'), method: 'PATCH' %></p>
</div>
