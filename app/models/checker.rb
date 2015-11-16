class Checker

  def self.correctPasswd(password)
    true && (password.length >= 6) && (/[a-z]/ === password) && (/[A-Z]/ === password) && (/\d+/ === password)
  end

end
