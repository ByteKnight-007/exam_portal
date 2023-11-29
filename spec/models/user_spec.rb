

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures Harshit name presence' do
      user = User.new( last_name: 'Kumar' , phone_number: "9366459010", college_id: 1, exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures Kumar name presence' do
      user = User.new( first_name: 'Harshit' , phone_number: "9366459010", college_id: 1, exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures phone number presence' do
      user = User.new(first_name: "Harshit", last_name: 'Kumar', college_id: 1, exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures college id presence' do
      user = User.new(first_name: "Harshit", last_name: 'Kumar', phone_number: "9366459010", exam_id: 2,start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures exam id presence' do
      user = User.new(first_name: "Harshit", last_name: 'Kumar', phone_number: "9366459010", college_id: 1, start_time: Time.zone.now).save
      expect(user).to eq(false)
    end

    it 'ensures start time presence' do
      user = User.new(first_name: "Harshit", last_name: 'Kumar', phone_number: "9366459010", college_id: 1, exam_id: 2).save
      expect(user).to eq(false)
    end
  end
end