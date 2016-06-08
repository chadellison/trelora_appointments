class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :status, :user_roles

  belongs_to :location, serializer: LocationSerializer
  belongs_to :user, serializer: UserSerializer

  def user_roles
    { ids: object.user.roles.pluck(:id), titles: object.user.roles.pluck(:title)}
  end

end
