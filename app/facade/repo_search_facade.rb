class RepoSearchFacade
  def self.private_repos(token)
    repos = GithubApiService.private_repos(token)

    repos.map do |repo|
      Repo.new(repo)
    end
  end

  def self.public_repos(token)
    repos = GithubApiService.public_repos(token)

    repos.map do |repo|
      Repo.new(repo)
    end
  end
end
