class Search
  extend ActiveModel::Naming
  attr_reader :term
  def initialize options = {}
    @term = options.fetch(:term, "")
  end

  def shouts
    Shout.search do
      fulltext term  
    end.results
  end
end
