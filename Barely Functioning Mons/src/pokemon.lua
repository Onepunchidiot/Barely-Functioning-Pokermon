local folder = 'src/pokemon/'
local files = NFS.getDirectoryItems(SMODS.current_mod.path .. folder)

for _, file in ipairs(files) do
  local poke = assert(SMODS.load_file(folder .. file))()

  if poke.init then poke.init() end

  if poke.list and #poke.list > 0 then
    for _, item in ipairs(poke.list) do
      if not item.atlas then
        poke_load_atlas(item)
        poke_load_sprites(item)
      end

      pokermon.Pokemon(item, "bfp")
    end
  end
end