local log = require 'termim.log'

local store = {
  _registry = {},
  _current = nil,
}

function store.insert(p)
  local idx = string.format("%p", p)

  store._registry[idx] = p
  store._current = idx
  log.trace("store insert entry: ", store)
end

function store.delete(p)
  local idx = string.format("%p", p)

  store._registry[idx] = nil
  log.trace("store delete entry: ", idx)
end

function store.current()
  return store._registry[store._current]
end

function store.is_empty()
  local idx, _ = next(store._registry)
  return idx == nil
end

return store
