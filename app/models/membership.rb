class Membership < ActiveRecord::Base

  before_create :populate_quid

  private

  def populate_quid
    self.quid = SecureRandom.uuid()
  end
end
