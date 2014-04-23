require 'spec_helper'

describe Location do
  it { should belong_to(:user) }
end
