require 'json'

version_manifest = '/opt/gitswarm/version-manifest.json'
key = 'build_version'

if File.exist?(version_manifest)
  Facter.add(:gitswarm_version) do
    version = 'N/A'
    data = JSON.parse(File.read(version_manifest))
  	if data[key]
  		version = data[key]
  	end
    setcode do
      version
    end
  end
end
