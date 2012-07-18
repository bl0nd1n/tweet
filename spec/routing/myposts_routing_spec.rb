require "spec_helper"

describe MypostsController do
  describe "routing" do

    it "routes to #index" do
      get("/myposts").should route_to("myposts#index")
    end

    it "routes to #new" do
      get("/myposts/new").should route_to("myposts#new")
    end

    it "routes to #show" do
      get("/myposts/1").should route_to("myposts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/myposts/1/edit").should route_to("myposts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/myposts").should route_to("myposts#create")
    end

    it "routes to #update" do
      put("/myposts/1").should route_to("myposts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/myposts/1").should route_to("myposts#destroy", :id => "1")
    end

  end
end
