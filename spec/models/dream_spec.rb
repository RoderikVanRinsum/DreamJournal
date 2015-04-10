# spec/models/dream.rb
require 'rails_helper'

describe Dream do
  it "has a valid factory" do
    expect(FactoryGirl.create(:dream)).to be_valid
  end
  it "is invalid without name" do
    expect(FactoryGirl.build(:dream, name: nil)).not_to be_valid
  end
  it "is invalid without description" do
    expect(FactoryGirl.build(:dream, description: nil)).not_to be_valid
  end
  it "returns a dream's keywords as a string"
end