# spec/models/dream.rb
require 'rails_helper'

describe Dream do
  

  it "has a valid factory" do
    expect(FactoryGirl.create(:dream)).to be_valid
  end

  #validation tests
  it "is invalid without name" do
    expect(FactoryGirl.build(:dream, name: nil)).not_to be_valid
  end

  it "is invalid without description" do
    expect(FactoryGirl.build(:dream, description: nil)).not_to be_valid
  end

  it "has a unique name" do
    FactoryGirl.create(:dream, name: "Double")
    expect(FactoryGirl.build(:dream, name: "Double")).not_to be_valid
  end

  #instance methods
  it "saves keywords after successful creation" do
    dream = FactoryGirl.create(:dream, name: "Name", description: "desc")
    expect(dream.keywords).to eq("name desc")
  end

  it "saves keywords after successful update" do 
    dream = FactoryGirl.create(:dream, name: "old", description: "desc")
    expect{dream.update(name: "new")}.to change{dream.keywords}.from("old desc").to("new desc")
  end

  #class methods & scopes
  describe '.search' do
    Dream.destroy_all #to destroy previous dreams, otherwise empty keyword test will fail

    let(:dream1) {FactoryGirl.create(:dream, name: "first night", description: "desc")}
    let(:dream2) {FactoryGirl.create(:dream, name: "second night", description: "desc")}
    let(:dream3) {FactoryGirl.create(:dream, name: "during the day", description: "desc")}

    context 'with matching keyword' do      
      it "returns results that match keyword" do
        expect(Dream.search("night")).to eq [dream1, dream2]
      end

      it "doesn't return results that don't match keyword" do
        expect(Dream.search("night")).not_to include(dream3)
      end
    end

    context 'with non-matching keyword' do
      it "returns an empty array" do
        expect(Dream.search("not_present")).to eq []
      end 
    end

    context 'when keyword is empty' do
      it "returns all results" do
        expect(Dream.search("")).to eq [dream1, dream2, dream3]
      end
    end
    
  end # 'describe .search'
  

end