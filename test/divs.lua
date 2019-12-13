-- vim: ts=2 sw=2 sts=2 expandtab:cindent:
--------- --------- --------- --------- --------- --------- 

package.path = '../src/?.lua;' .. package.path
local Lib=require("lib")
local ok   = require("ok")

local divs = require("divs")

local r, o, same, round = Lib.r, Lib.o, Lib.same, Lib.round
local within= Lib.within

local function big(   a,s,m,d)
  a,m = {},1000
  for i=1,m do a[#a+1] = round(i/m,3) end
  d= divs(a)
  o(d)
  assert(within(0.4,d[4][1],0.43))
end

ok{big= big} 

ok{autos= function(  a,d)
  a={10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10 , 10, 10,
  10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
  10, 10, 10, 10, 10, 10, 10, 10 , 10, 10, 10, 10,
  10, 10, 10, 10, 10, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20 , 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20 , 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20 , 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20 ,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20 , 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20 , 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20 , 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20,
  20, 20, 20, 20 , 20, 20, 20, 20, 20, 20, 20, 20,
  20, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30 , 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30 ,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30 , 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30 , 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30 , 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 30, 30 , 30, 30, 30, 30, 30, 30, 30, 30,
  30, 30, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,
  40, 40 , 40, 40, 40, 40, 40, 40, 40, 40, 40, 40,
  40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40 ,
  40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40 ,
  40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40, 40 ,
  40, 50 }
  d= divs(a)
  assert(d[1][1]==10)
  assert(d[2][1]==20)
  assert(d[3][1]==30)
  assert(d[4][1]==40)
end}
