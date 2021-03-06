# == Schema Information
#
# Table name: project_relations
#
#  id           :integer         not null, primary key
#  project_id   :integer         not null
#  osm_id       :integer(8)      not null
#  version      :integer         not null
#  user_id      :integer         not null
#  tstamp       :datetime        not null
#  changeset_id :integer(8)      not null
#  tags         :hstore
#  status       :text
#

require 'spec_helper'

describe ProjectRelation do
  describe "xml interface" do
    subject { FactoryGirl.create(:project_relation_with_members) }

    it "should output the attributes" do
      subject.to_xml.to_s.should include(' id="2"')
      subject.to_xml.to_s.should include(' version="4"')
    end

    it "should list the members" do
      subject.relation_members.count.should eql(2)
      subject.relation_members.each do |member|
        subject.to_xml.to_s.should include(" ref=\"#{member.member_id}\"")
      end
    end
  end
end
