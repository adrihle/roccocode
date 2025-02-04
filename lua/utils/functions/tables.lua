TABLES = {}

TABLES.table_merge = function(...)
  local tables_to_merge = { ... }
  assert(#tables_to_merge > 1, "There should be at least two tables to merge them")

  for k, t in ipairs(tables_to_merge) do
    assert(type(t) == "table", string.format("Expected a table as function parameter %d", k))
  end

  local result = tables_to_merge[1]

  for i = 2, #tables_to_merge do
    local from = tables_to_merge[i]
    for _, tablesFrom in pairs(from) do
      table.insert(result, tablesFrom)
    end
  end

  return result
end

TABLES.dump = function(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. ' ['..k..'] = ' .. TABLES.dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

return TABLES
