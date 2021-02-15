require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe HomeHelper, type: :helper do
  describe 'representatives_by_name_or_district' do 
    let!(:rep1) { Representative.create(name: 'Billy McGee', district: "GA01") }
    let!(:rep2) { Representative.create(name: 'Hank Williams', district: "TN03") }
    let!(:rep3) { Representative.create(name: 'Willie Nelson', district: "GA03") }
    let!(:rep4) { Representative.create(name: 'Merle Haggard', district: "FL01") }
    let!(:rep5) { Representative.create(name: 'Billy Joel', district: "GA02") }

    it 'returns represenatives with names that match the search criteria' do
      results = helper.representatives_by_name_or_district(name: 'Billy')
      expect(results.length).to eq(2)
      expect(results).to contain_exactly(rep1, rep5)
    end

    it 'returns reps whose district match the search criteria' do 
      results = helper.representatives_by_name_or_district(district: 'GA')
      expect(results.length).to eq(3)
      expect(results).to contain_exactly(rep1, rep3, rep5)
    end

    it 'returns no results if no reps match the search criteria' do
      results = helper.representatives_by_name_or_district(district: 'MI')
      expect(results.length).to eq(0)
      expect(results).to eq([])
    end
  end
end
