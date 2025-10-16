#!/usr/bin/env ruby

# Remove duplicate LiquidGlassComponents.swift entries

require 'xcodeproj'

project_path = File.join(__dir__, 'ios', 'Runner.xcodeproj')

puts "Opening Xcode project..."
project = Xcodeproj::Project.open(project_path)

runner_target = project.targets.find { |target| target.name == 'Runner' }
runner_group = project.main_group['Runner']

puts "Finding duplicate entries..."

# Find all file references with this name
liquid_glass_files = runner_group.files.select { |f| f.path&.include?('LiquidGlassComponents.swift') }

puts "Found #{liquid_glass_files.count} file references"

if liquid_glass_files.count > 1
  puts "Removing duplicates..."
  
  # Keep only the one with correct path (just filename, not Runner/filename)
  liquid_glass_files.each do |file|
    if file.path == 'Runner/LiquidGlassComponents.swift'
      puts "  Removing incorrect path: #{file.path}"
      # Remove from build phase
      runner_target.source_build_phase.files.each do |build_file|
        if build_file.file_ref == file
          runner_target.source_build_phase.files.delete(build_file)
        end
      end
      # Remove from group
      file.remove_from_project
    elsif file.path == 'LiquidGlassComponents.swift'
      puts "  Keeping correct path: #{file.path}"
    end
  end
  
  puts "✅ Duplicates removed"
else
  puts "No duplicates found"
end

puts "Saving project..."
project.save

puts "\n✅ Done! Run: flutter clean && flutter run"

