return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "1.1.6",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 100,
  height = 132,
  tilewidth = 16,
  tileheight = 16,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "RogueDungeon",
      firstgid = 1,
      filename = "test.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      image = "../RogueDungeon.png",
      imagewidth = 128,
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 128,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 100,
      height = 132,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      compression = "zlib",
      data = "eJzt17EOwiAUBdBWXapO6v9/q29wICQQ6KvR4ZzkLk27cAOPLgswYousn2xF1k5OkXPkUn1DXrnOo31cI7fIfdHH0Xrr3soj8oy8qufktc6hPT2R1zqH9PEb5exonUO9mB/Hmp3l+vguffyX2RnR64282f1Rv1feycjL9lHeycjbc69t/RsCAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAjHoDHfIDUw=="
    },
    {
      type = "tilelayer",
      name = "walls",
      x = 0,
      y = 0,
      width = 100,
      height = 132,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["collidable"] = true
      },
      encoding = "base64",
      compression = "zlib",
      data = "eJzt2MEJgEAMAMFrSbQBn4L916MtCIcsOgP5hsD+MgZFyz3rxNnePf9z9vi+v9GjRY8WPVr0aNGjRY8WPVr0aNGjRY8WPVqOMfefeL57PgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADxyAdzUDqU="
    }
  }
}
