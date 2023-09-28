class Quote < ApplicationRecord

  scope :ordered, -> { order(id: :desc) }
  #after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self } }
  broadcasts_to ->(quote) { "quotes" }, inserts_by: :prepend

end
