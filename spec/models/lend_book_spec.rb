require 'spec_helper'

describe LendBook do
  it { should belong_to(:book) }
  it { should belong_to(:user) }
end
