#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  Modification du comportement de Game_Map
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  # * alias
  #--------------------------------------------------------------------------
  alias :autoshadow_setup :setup
  #--------------------------------------------------------------------------
  # * Setup
  #--------------------------------------------------------------------------
  def setup(map_id)
    autoshadow_setup(map_id)
    erase_autoshadow
  end
  #--------------------------------------------------------------------------
  # * Supprime les auto_shadows
  #--------------------------------------------------------------------------
  def erase_autoshadow
    (data.xsize).times do |x|
      (data.ysize).times do |y|
        if (data[x,y,3] & 15) != 0
          data[x,y,3] &= 0xFFF0
        end
      end
    end
  end
end
