#!/usr/bin/ruby

require 'yaml'

$data = YAML.load(ARGF.read())

RED = 31
GREEN = 32

def colorize(text, color)
  "\e[#{color}m#{text}\e[0m"
end

def count(status)
  return $data[status].length
end

def test(status)
  ng = 0
  for cmd in $data[status] do
    puts colorize("[BTEST RUN] ", GREEN) + cmd
    if (status == "success") then
      cmd = "./btest.sh " + cmd
    elsif (status == "error") then
      cmd = "./btest.sh -e " + cmd
    else
      assert(false)
    end
    IO.popen(cmd) { |io| puts io.readlines }
    if ($?.exitstatus == 1) then
      ng += 1
    end
  end
  return ng
end

total = count("success") + count("error")
ng = test("success") + test("error")
ok = total - ng
sum = "[BTEST SUM] OK " + ok.to_s + " NG " + ng.to_s

puts
if ng > 0 then
  puts colorize(sum, RED)
  exit 1
else
  puts colorize(sum, GREEN)
  exit 0
end
