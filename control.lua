script.on_init(
  function()
    if remote.interfaces["freeplay"] then
      local care_package = remote.call("freeplay", "get_created_items")
      care_package["gunpowder"] = 100
      care_package["brass-plate"] = 100
      remote.call("freeplay", "set_created_items", care_package)
    end
  end
)