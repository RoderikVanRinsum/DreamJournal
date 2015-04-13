# spec/models/dream.rb
require 'rails_helper'

describe Dream do
  let!(:created_valid_dream) {FactoryGirl.create(:dream, name: "created_name", description: "desc")}

  it "has a valid factory" do
    expect(FactoryGirl.create(:dream)).to be_valid
  end

  describe 'validations and relationships:' do
    it { should have_many(:dreamsigns)}
    it { should have_many(:dream_dreamsigns)}

    context 'when name and description are present' do
      subject {FactoryGirl.build(:dream, name: "built_name", description: "desc")}

      its(:name) { is_expected.not_to be_nil }
      its(:description) { is_expected.not_to be_nil}
      it { is_expected.to be_valid }
    end

    it { should validate_presence_of(:name) }

    it "is invalid without name" do
      expect(FactoryGirl.build(:dream, name: nil)).not_to be_valid
    end

    it { should validate_presence_of(:description)}

    it "is invalid without description" do
      expect(FactoryGirl.build(:dream, description: nil)).not_to be_valid
    end

    it { should validate_uniqueness_of(:name)}

    it "has a unique name" do
      expect(FactoryGirl.build(:dream, name: "created_name")).not_to be_valid
    end
  end

  #instance methods
  describe '#set_keywords' do
    it "saves keywords after successful creation" do
      expect(created_valid_dream.keywords).to eq("created_name desc")
    end

    it "saves keywords after successful update" do 
      expect {created_valid_dream.update(name: "new")}.to change {created_valid_dream.keywords}.from("created_name desc").to("new desc")
    end

    it "doesn't save keywords after update fails" do
      allow_any_instance_of(Dream).to receive(:save).and_return(false)
      expect {created_valid_dream.update(name: "new")}.not_to change {created_valid_dream.keywords}
    end
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
        expect(Dream.search("")).to eq [created_valid_dream, dream1, dream2, dream3]
      end
    end
    
  end # 'describe .search'
  

end