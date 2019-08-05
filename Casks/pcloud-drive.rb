cask 'pcloud-drive' do
  version '3.8.2'
  sha256 '098950a4351af5f04634338ccf511af9c83e811aefa7307917d5df82bb814084'

  url do
    require 'net/http'
    require 'json'
    api = 'https://api.pcloud.com/'
    code = 'XZdyYi7Z0vryE3pIG7Yue4q2fp0spbKhrXp7'
    uri = URI(api + 'getpublinkdownload?code=' + code)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['hosts'][0] + data['path']
  end
  name 'pCloud Drive'
  homepage 'https://www.pcloud.com/'

  depends_on cask: 'osxfuse'

  pkg 'pCloud Drive 3.8.2.pkg'

  uninstall quit:    'com.pcloud.pcloud.macos',
            pkgutil: 'com.mobileinno.pkg.pCloudDrive'
end
