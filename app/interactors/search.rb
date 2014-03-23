class Search
  include Interactor::Organizer

  organize ParseQuery, SearchWithCondition
end
