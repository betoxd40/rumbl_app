alias Rumbl.Repo
alias Rumbl.Categories.Schema.Category

for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Repo.insert!(%Category{name: category})
end
