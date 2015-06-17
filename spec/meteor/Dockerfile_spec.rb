require "spec_helper"

describe "Dockerfile" do
  before(:all) do
    image = Docker::Image.build_from_dir('.')

    set :os, family: :debian
    set :backend, :docker
    set :docker_image, image.id

  end

  it "installs the correct version of Ubuntu" do
    expect(os_version).to include("Ubuntu 14")
  end

  it "installs the correct version of Meteor" do
    expect(meteor_version).to include("1.1.0.2")
  end

  def os_version
    command("lsb_release -a").stdout
  end

  def meteor_version
    command("meteor --version").stdout
  end
end
