require 'rubygems'


module Settings
  VERSION = '0.0.0'

  MEDUSA_PATH = File.expand_path(File.dirname(__FILE__))

  SRC_DIR_NAME = 'src'
  BIN_DIR_NAME = 'bin'

  SRC_PATH = File.join(MEDUSA_PATH, SRC_DIR_NAME)
  BIN_PATH = File.join(MEDUSA_PATH, BIN_DIR_NAME)

  SRC_MESSAGE = "#{SRC_DIR_NAME}/*.coffee"
  BIN_MESSAGE = "#{BIN_DIR_NAME}/*.js"

  ORDER_COFFEESCRIPT = [
    'exceptions',
    'browser',
    'screensaver',
  ]
  COFFEESCRIPTS_FILES = ORDER_COFFEESCRIPT.map do |i|
    "#{Settings::SRC_PATH}/#{i}.coffee"
  end
end

def compile_and_join_coffeescripts(result_file)
    options = "--compile"
     %x(coffee  --join #{result_file} #{options} #{Settings::COFFEESCRIPTS_FILES.join(' ')})
end

namespace :coffee do
  desc "compile coffeescripts files"
  task :compile do
    puts "compile #{Settings::SRC_MESSAGE} files to #{Settings::BIN_MESSAGE}"

    options = "--compile"
    %x(coffee --output  #{Settings::BIN_PATH} #{options} #{Settings::SRC_PATH})
  end

  desc "compile & watch coffeescripts files"
  task :watch do
    puts "compile & watch #{Settings::SRC_MESSAGE} files to #{Settings::BIN_MESSAGE}"

    options = "--compile --watch"
    %x(coffee --output  #{Settings::BIN_PATH} #{options} #{Settings::SRC_PATH})
  end

  desc "compile & join coffeescripts files"
  task :join do
    puts "compile & join #{Settings::SRC_MESSAGE} files to #{Settings::BIN_MESSAGE}"

    result_file = ARGV.last
    compile_and_join_coffeescripts(result_file)
  end
end

namespace :release do
  desc "show current version"
  task :version do
    puts "current version #{Settings::VERSION}"
  end

  desc "build new release"
  task :build do
    puts "build release #{Settings::VERSION}"

    %x(rm medusa-*.js)
    result_file = "medusa-#{Settings::VERSION}.js"
    compile_and_join_coffeescripts(result_file)
  end
end
