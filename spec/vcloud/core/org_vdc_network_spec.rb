require 'spec_helper'

module Vcloud

  describe Vcloud::Core::OrgVdcNetwork do

    before (:each) do
      @mock_fog_interface = StubFogInterface.new
      Vcloud::Fog::ServiceInterface.stub(:new).and_return(@mock_fog_interface)
    end

    context "#initialize" do

      it "should fail if constructed with no args" do
        expect{ Vcloud::Core::OrgVdcNetwork.new() }.to raise_exception(ArgumentError)
      end

      it "should be constructable from just an id reference" do
        obj = Vcloud::Core::OrgVdcNetwork.new('1234578-1234-1234-1234567890ab') 
        expect(obj.class).to be(Vcloud::Core::OrgVdcNetwork)
      end

    end

    context "#provision" do

      it "should fail if called with no args" do
        expect { Vcloud::Core::OrgVdcNetwork.provision() }.to raise_exception(ArgumentError)
      end

      it "should return an OrgVdcNetwork if all goes to plan" do
        config = { 
          :name => 'test-net-1', 
          :vdc_name => 'test-vdc-1',
          :fence_mode => 'isolated' 
        }
        obj = Vcloud::Core::OrgVdcNetwork.provision(config)
        expect(obj.class).to be(Vcloud::Core::OrgVdcNetwork)
      end

    end

  end

end
