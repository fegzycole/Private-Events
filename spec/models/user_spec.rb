# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: 'Ferguson', email: 'fergusoniyara@gmail.com') }

  context 'Properly created user' do
    it 'properly creates a user' do
      expect(user).to be_valid
    end
  end

  context 'Invalid user information' do
    it 'throws an error if the email is invalid ' do
      user = User.new(name: 'Ferguson', email: 'fergusoniyaragmail.com')
      expect(user.valid?).to eql(false)
    end

    it 'throws an error if the name is less than 3 characters' do
      user = User.new(name: '', email: 'fergusoniyaragmail.com')
      expect(user.valid?).to eql(false)
    end

    it 'throws an error if the name is more than 20 characters' do
      name = (0..21).map { ('a'..'z').to_a[rand(26)]}.join
      user = User.new(name: name, email: 'fergusoniyaragmail.com')
      expect(user.valid?).to eql(false)
    end

    it 'throws an error if the email is more than 244 characters' do
      email = (0..236).map { ('a'..'z').to_a[rand(26)]}.join
      email += 'email.com'
      user = User.new(name: 'Kalavhan', email: email)
      expect(user.valid?).to eql(false)
    end
  end

  context 'User Associations' do
    it 'can create events' do
      user.save
      user.created_events.build(location: 'The palms', description: 'Meeting with friends', date: '2020-03-04')
      user.save
      expect(user.created_events.length).to eql(1)
    end

    it 'can have attended events by invitation' do
      user.save
      expect(user.attended_events[0]).to eql(nil)
      expect(user.attended_events).to be_truthy
    end
  end
end
