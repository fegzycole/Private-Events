require 'rails_helper'
RSpec.describe Event, type: :model do

  describe 'Event' do
    it { should validate_presence_of(:location) }
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:date)}
    it { should have_many(:attendees)}
    it { should belong_to(:creator)}
    it { should allow_value("Canada").for(:location)}
    it { should_not allow_value("b").for(:location) }
    it {
      location = (0..52).map { ('a'..'z').to_a[rand(26)]}.join
      should_not allow_value(location).for(:location)
    }
    it { should allow_value("Meeting at the park").for(:description)}
    it {
      description = (0..256).map { ('a'..'z').to_a[rand(26)]}.join 
      should_not allow_value(description).for(:description)
    }
    it { should allow_value("2020-01-10").for(:date)}
  end
end