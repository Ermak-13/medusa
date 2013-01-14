require 'rubygems'


module Settings
  MEDUSA_PATH = File.expand_path(File.dirname(__FILE__))

  SRC_DIR_NAME = 'src'
  BIN_DIR_NAME = 'bin'

  SRC_PATH = File.join(MEDUSA_PATH, SRC_DIR_NAME)
  BIN_PATH = File.join(MEDUSA_PATH, BIN_DIR_NAME)

  SRC_MESSAGE = "#{SRC_DIR_NAME}/*.coffee"
  BIN_MESSAGE = "#{BIN_DIR_NAME}/*.js"
end

namespace :coffee do
  desc "compile coffeescripts files"
  task :compile do
    puts "compile #{Settings::SRC_MESSAGE} files to #{Settings::BIN_MESSAGE}"

    options = "--compile --output"
    %x(coffee #{options} #{Settings::BIN_PATH} #{Settings::SRC_PATH})
  end

  desc "compile & watch coffeescripts files"
  task :watch do
    puts "compile & watch #{Settings::SRC_MESSAGE} files to #{Settings::BIN_MESSAGE}"

    options = "--compile --watch --output"
    %x(coffee #{options} #{Settings::BIN_PATH} #{Settings::SRC_PATH})
  end
end
