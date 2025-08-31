-- extern.lua
-- Open external links in a new tab; keep internal/same-domain + relative links as-is.

local function is_external(url, domain)
  if not url then return false end
  if url:match("^https?://") or url:match("^//") then
    if domain and #domain > 0 then
      -- escape for Lua patterns
      local esc = domain:gsub("%%","%%%%"):gsub("%.","%%."):gsub("%-","%%-")
      if url:match("^https?://[^/]*" .. esc .. "(/.*)?$") or url:match("^//[^/]*" .. esc .. "(/.*)?$") then
        return false -- same domain → internal
      end
    end
    return true
  end
  return false
end

function Link(el)
  local domain = os.getenv("DOMAIN") or ""  -- read from environment
  if is_external(el.target, domain) then
    el.attributes.target = "_blank"
    local rel = (el.attributes.rel or "")
    if not rel:match("noopener") then rel = (rel .. " noopener") end
    if not rel:match("noreferrer") then rel = (rel .. " noreferrer") end
    el.attributes.rel = (rel:gsub("^%s*(.-)%s*$", "%1"))
  end
  return el
end
