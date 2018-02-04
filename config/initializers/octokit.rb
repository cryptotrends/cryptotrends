OctoClient = Octokit::Client.new(
  login: Figaro.env.github_name,
  password: Figaro.env.github_password)
