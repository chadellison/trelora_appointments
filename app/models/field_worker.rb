class FieldWorker < ActiveRecord::Base
  has_many :appointments
  has_many :locations, through: :appointments

  def self.create_f_w(f_w_params)
    f_w_params[:icon] = TreloraService.new.trelorian_small_img_url(f_w_params["trelora_id"])
    FieldWorker.find_or_create_by(f_w_params)
  end

  enum role: ["photographer", "appraiser"]
end
