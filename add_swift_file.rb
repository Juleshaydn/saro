#!/usr/bin/env ruby

# Script to add LiquidGlassComponents.swift to Xcode project
# This fixes the "Cannot find 'LiquidGlassLoginViewFactory'" error

require 'xcodeproj'

project_path = File.join(__dir__, 'ios', 'Runner.xcodeproj')
swift_file_path = 'LiquidGlassComponents.swift'  # Just filename, group already has path

puts "Opening Xcode project..."
project = Xcodeproj::Project.open(project_path)

# Find the Runner target
runner_target = project.targets.find { |target| target.name == 'Runner' }

if runner_target.nil?
  puts "❌ Error: Could not find Runner target"
  exit 1
end

# Find the Runner group by path
runner_group = project.main_group['Runner']

if runner_group.nil?
  puts "❌ Error: Could not find Runner group"
  puts "Available groups: #{project.main_group.groups.map(&:display_name).join(', ')}"
  exit 1
end

# Check if file already exists
existing_file = runner_group.files.find { |file| file.path == 'LiquidGlassComponents.swift' }

if existing_file
  puts "✅ LiquidGlassComponents.swift is already in the project"
else
  puts "Adding LiquidGlassComponents.swift to project..."
  
  # Add file reference to the Runner group
  file_ref = runner_group.new_file(swift_file_path)
  
  # Add file to the build phase
  runner_target.source_build_phase.add_file_reference(file_ref)
  
  puts "✅ Successfully added LiquidGlassComponents.swift to project"
end

# Save the project
puts "Saving project..."
project.save

puts "\n✅ Done! You can now run: flutter run"

