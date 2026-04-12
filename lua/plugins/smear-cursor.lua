return {
  "sphamba/smear-cursor.nvim",
  lazy = false,
  opts = {
    stiffness = 0.6,           -- Lowered from 0.8 to allow for smoother travel
    trailing_stiffness = 0.5,  -- Loosened up to create that satisfying "glide" effect
    trailing_exponent = 0.1,   -- Adds just a hint of stretch during fast movements
  }
}
