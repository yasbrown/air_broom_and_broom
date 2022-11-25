if @review.persisted?
  json.form render(partial: "reviews/form", formats: :html, locals: {broomstick: @broomstick, review: Review.new})
  json.inserted_item render(partial: "broomsticks/review", formats: :html, locals: {review: @review})
else
  json.form render(partial: "reviews/form", formats: :html, locals: {broomstick: @broomstick, review: @review})
end
