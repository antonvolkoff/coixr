class Search
  include Interactor::Organizer

  organize ParseQuery, SearchWithConditions
end
