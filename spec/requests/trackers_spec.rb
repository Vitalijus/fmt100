 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/trackers", type: :request do
  
  # Tracker. As you add validations to Tracker, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Tracker.create! valid_attributes
      get trackers_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tracker = Tracker.create! valid_attributes
      get tracker_url(tracker)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tracker_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      tracker = Tracker.create! valid_attributes
      get edit_tracker_url(tracker)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Tracker" do
        expect {
          post trackers_url, params: { tracker: valid_attributes }
        }.to change(Tracker, :count).by(1)
      end

      it "redirects to the created tracker" do
        post trackers_url, params: { tracker: valid_attributes }
        expect(response).to redirect_to(tracker_url(Tracker.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Tracker" do
        expect {
          post trackers_url, params: { tracker: invalid_attributes }
        }.to change(Tracker, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post trackers_url, params: { tracker: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tracker" do
        tracker = Tracker.create! valid_attributes
        patch tracker_url(tracker), params: { tracker: new_attributes }
        tracker.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tracker" do
        tracker = Tracker.create! valid_attributes
        patch tracker_url(tracker), params: { tracker: new_attributes }
        tracker.reload
        expect(response).to redirect_to(tracker_url(tracker))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        tracker = Tracker.create! valid_attributes
        patch tracker_url(tracker), params: { tracker: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested tracker" do
      tracker = Tracker.create! valid_attributes
      expect {
        delete tracker_url(tracker)
      }.to change(Tracker, :count).by(-1)
    end

    it "redirects to the trackers list" do
      tracker = Tracker.create! valid_attributes
      delete tracker_url(tracker)
      expect(response).to redirect_to(trackers_url)
    end
  end
end