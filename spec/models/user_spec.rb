# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should allow_value('Kalavhan').for(:name) }
    it { should_not allow_value('K').for(:name) }
    it { should_not allow_value('').for(:name) }
    name = (0..21).map { ('a'..'z').to_a[rand(26)] }.join
    it { should_not allow_value(name).for(:name) }
    email = (0..236).map { ('a'..'z').to_a[rand(26)] }.join
    email += 'email.com'
    it { should_not allow_value(email).for(:email) }
    it { should have_many(:created_events) }
    it { should have_many(:attended_events) }
  end
end
