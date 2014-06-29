require 'test_helper'

describe "#new" do
    it "takes three parameters and returns a Book object" do
        @book.should be_an_instance_of Book
    