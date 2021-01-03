class ReposController < ApplicationController
  def public
    @repos = RepoSearchFacade.public_repos(current_user.token)
  end

  def private
    @repos = RepoSearchFacade.private_repos(current_user.token)
  end
end
