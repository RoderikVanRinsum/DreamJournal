# spec/models/dream.rb
require 'rails_helper'

describe Dream do
  it "has a valid factory" do
    expect(FactoryGirl.create(:dream)).to be_valid
  end
  it "is invalid without name"
  it "is invalid without description"
  it "returns a dream's keywords as a string"
end