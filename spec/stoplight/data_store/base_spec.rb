# coding: utf-8

require 'spec_helper'

describe Stoplight::DataStore::Base do
  subject(:data_store) { described_class.new }

  %i(
    clear_failures
    failure_threshold
    failures
    names
    record_attempt
    record_failure
    set_failure_threshold
    set_state
    state
  ).each do |method|
    it "responds to #{method}" do
      expect(data_store).to respond_to(method)
    end

    it "does not implement #{method}" do
      args = [nil] * data_store.method(method).arity
      expect { data_store.public_send(method, *args) }.to raise_error(
        NotImplementedError)
    end
  end
end