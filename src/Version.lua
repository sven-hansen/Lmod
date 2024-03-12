local M={}
function M.branch()
   return "main"
end
function M.branchStr()
   local s = M.branch()
   if (s == "main") then
      s = ""
   end
   return s == "" and s or "[branch: "..s.."]"
end
function M.tag()  return "<tag>"   end
function M.tag()  return "8.7.34"   end
function M.git()
   local s = "8.7.34-25-g516266fa"
   if (s == "@" .. "git@") then s = "" end
   if (s == M.tag()      ) then s = "" end
   return s == "" and s or "("..s..")"
end
function M.date() return "2024-03-11 18:05 -06:00" end
function M.name()
  local a = {}
  a[#a+1] = M.tag()
  a[#a+1] = M.git()
  a[#a+1] = M.branchStr()
  a[#a+1] = M.date()
  return table.concat(a," ")
end
return M
