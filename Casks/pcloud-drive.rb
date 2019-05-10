cask 'pcloud-drive' do
  version '3.8.0'
  sha256 'eba5cc498d30f40bf59687f4735d6ce85dbc9bd0b796d031d555697b5f136f27'

  url do
    require 'net/http'
    require 'json'
    api = 'https://api.pcloud.com/'
    code = 'XZ1iEq7ZoadxW18P0UJDHIzwJ1QI7fijII7X'
    uri = URI(api + 'getpublinkdownload?code=' + code)
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)
    data['hosts'][0] + data['path']
  end
  name 'pCloud Drive'
  homepage 'https://www.pcloud.com/'

  depends_on cask: 'osxfuse'

  pkg 'pCloud Drive 3.8.0.pkg'

  uninstall quit:    'com.pcloud.pcloud.macos',
            pkgutil: 'com.mobileinno.pkg.pCloudDrive'
end
