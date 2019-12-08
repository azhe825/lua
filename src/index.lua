-- vim: ts=2 sw=2 sts=2 expandtab:cindent:
------- --------- --------- --------- --------- --------- 

-- <center><img width=500
--  src="https://raw.githubusercontent.com/timm/lua/master/etc/img/index.png"></center>


-- <center><img width=500
--  src="https://raw.githubusercontent.com/timm/lua/master/etc/img/index1.png"></center>

-- Why combine data miners and optimisers? Well, consider:
--
-- - Data miners divide up some space of things. 
-- - Optimizers suggest ways to move in a space.
-- - So, in short, both approaches are ways to model and understand that space.

-- So data miners and optimizers are two sides of the same coin.
-- By refactoring and combining both approaches, we can find simple ways to (e.g.) optimize
-- with fewer samples to that space or (e.g.) build classifiers or regression tools
-- that satisfy
-- multiple objectives. 
--
-- Any why code this in LUA?
-- 
-- - LUA is  a wonderful language: clean and simple syntax, quick to learn, very portable, supports
-- garbage collection, objects, functional programming, and tail call optimization. Also, it is
-- well documented, and can has a friendly and enthusiastic  support community.
-- - When you need AI on edge devices,
-- better to use something very concise and lightweight (like LUA).
-- - Finally, LUA is very useful  for training graduate students in how to build AI systems ("Here, take this executable
-- specification and code it up in e.g. Python"). 
--
-- ## Contents
