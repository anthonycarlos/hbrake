#!/usr/bin/env ruby
# hb
# Usage: hb <subtitle_track>
# Create handbrake.txt to document what was used by HandBrake.
# The title is deduced from the name of the present working directory.

title = File.basename(ENV['PWD'])
subtitle_track = ARGV[0]
if ARGV[1] == 'VOBSUB'
  subtitle_style = "(Bitmap) (VOBSUB)"
  subtitle_option = "(VOBSUB)"
else
  subtitle_style = "(Text) (CC)"
  subtitle_option = "(MOV_TEXT)"
end

template = <<-END_OF_TEMPLATE
#{title}
Handbrake Settings
High Profile
Format
  MP4 File
Video
Audio
Subtitles
  #{subtitle_track}: English #{subtitle_style}
    Forced Only unchecked
    Burned In unchecked
    Default unchecked
    Srt Language Unknown
    Srt Char Code ANSI_X3.4-19
    Srt Offset 0
Channels

Plex subtitle options are None and English #{subtitle_option}.
END_OF_TEMPLATE
File.open('handbrake.txt', 'w') do |f|
  f.write template
end
