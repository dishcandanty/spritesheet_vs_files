require 'app/spritesheet.rb'
require 'app/sprite_files.rb'

# Easy Toggle
$which_one_which_one = true

def tick(args)
  $tick = args.state.tick_count

  if $tick.zero?
    args.state[:anim] = []

    if $which_one_which_one
      # Using a singular Sprite Sheet
      1500.times do
        args.state[:anim].push SpriteSheet.new
      end
      args.state[:anim].push(
        x: 100, y: 400, primitive_marker: :label, text: 'Spritesheet', r: 255, b: 255, g: 255, a: 255,
        size_enum: 70
      )

    else
      # Using Individual Files
      1500.times do
        args.state[:anim].push SpriteFiles.new
      end
      args.state[:anim].push(
        x: 100, y: 400, primitive_marker: :label, text: 'Files', r: 255, b: 255, g: 255, a: 255,
        size_enum: 70
      )
    end
  end

  args.outputs.background_color = [0, 0, 0]
  args.outputs.primitives << args.state[:anim]
  args.outputs.primitives << args.gtk.framerate_diagnostics_primitives
end
