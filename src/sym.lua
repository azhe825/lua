-- vim: ts=2 sw=2 sts=2 expandtab:cindent:
--------- --------- --------- --------- --------- --------- 

local Column = require("column")
local Lib   = require("lib")
local THE   = require("the")
local Sym   = {is="Sym"}

function Sym.var(i) return Sym.ent(i) end
function Sym.mid(i) return i.mode end
function Sym.summary(i) 
  return Lib.sprintf("%s %5.2f",
          Sym.mid(i), 
          Sym.var(i))
end

function Sym.xpect(i,j,  n)  
  n = i.n + j.n +0.0001
  return i.n/n * Sym.ent(i) + j.n/n * Sym.ent(j) 
end

function Sym.new(t)
  local i  = Column.new(t)
  i.me     = Sym
  i.counts = {}
  i.most   = 0
  i.mode   = nil
  i.ent   = nil
  return i
end

function Sym.ent(i)
  if i.ent == nil then
    i.ent = 0
    for k,v in pairs(i.counts) do
      local p = v/i.n
      i.ent = i.ent - p*math.log(p,2) end end
  return i.ent
end

-- Bulk addition to a `Num`.
function Sym.all(a,key,lo,hi,    i)
  i = Sym.new{key=key}
  for j = lo or 1, hi or #a do Sym.add(i, a[j]) end
  return i
end

-- Add one item to a `Num`.
function Sym.add(i,x,   d)
  if x=="?" then return x end
  x = i.key(x)
  i.n = i.n + 1
  i.ent= nil
  d = (i.counts[x] or 0) + 1
  i.counts[x] = d
  if d > i.most then i.most, i.mode = d, x end
end

function Sym.sub(i,x,   d)
  if x=="?" then return x end
  x = i.key(x)
  i.ent= nil
  if i.n > 0 then
    i.n = i.n - 1
    i.counts[x] = i.counts[x] - 1 end
end

function Sym.xpect(i,j,   n)  
  n = i.n + j.n + 0.0001
  return i.n/n * Sym.ent(i) + j.n/n * Sym.ent(j)
end

-- --------
-- Distance between rows
function Sym.dist(i,x,y)
  if   x == THE.char.skip and y == THE.char.skip then return 1
  else return  x==y  and 0 or 1
  end
end
 
function Sym.div(i,rows,fx,fy,ytype)
  local n,out,all,cuts = 0,0,{},{}
  for _,row in pairs(rows) do
    local x = fx(row)
    if x ~= THE.chars.skip then
      n = n + 1 -- unify with num
      local one = all[x] or ytype.new{txt=x}
      ytype.add(one, fy(row)) end end
  cuts = {}
  for n,one in pairs(all) do
    cuts[n] = {lo=one.txt, hi=one.txt, n=one.n}
    out = out + one.all.n / n * ytype.var(one) end 
  table.sort(cuts,function(a,b) return a.n > b.n end)
  return out,cuts
end

-- ----------
-- And finally...


return Sym
