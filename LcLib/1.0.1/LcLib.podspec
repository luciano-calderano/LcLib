Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '11.0'
s.name = "LcLib"
s.summary = "LcLib - Utilità standard."
s.requires_arc = true
s.swift_version = "4.2"

# 2
s.version = "1.0.1"

# 3
s.license = { :type => 'LcLib License #{s.version}', :text => <<-LICENSE
Licensed LcLib free #{s.version} (by Lc)

LICENSE
}

# 4 - Replace with your name and e-mail address
s.author = { "Luciano C." => "luciano.c@virgilio.it" }


# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/lucianocalderano"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/lucianocalderano/LcLib.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit"

# 8
s.source_files = "LcLib/**/*.{swift}"

# 9
#s.resources = ""
end
