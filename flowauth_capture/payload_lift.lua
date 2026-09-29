
-- Luraph runtime function (from the VM object, not part of the script: not lifted).
-- LPH_ENCFUNC decrypts a function this way: (key, encrypted buffer, ...) -> function.
local function luraph_runtime1(...)
	error("Luraph runtime function, not devirtualized")
end

local r2 = {
	[42] = islclosure,
	[282] = "delay",
	[462] = function()
		error("devirt: newindex None (at 0:10)")
	end,
	[569] = "AnchorPoint",
	[292] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:14)")
	end,
	[532] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:8)")
	end,
	[417] = function(s1)
		local s4 = s1[366](s1[552])
		error("devirt: newindex None (at 0:10)")
	end,
	[81] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:7)")
	end,
	[337] = function(arg1, s2, arg3)
		arg3[62](s2)
		error("devirt: index nil @272,676217 - 272,676221 (at 0:11)")
	end,
	[646] = "NextInteger",
	[158] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[123] = "readu32",
	[84] = function(arg1, arg2)
		arg2(1406805474)
		error("devirt: index nil @272,676217 - 272,676221 (at 0:15)")
	end,
	[495] = "source",
	[355] = function(arg1, arg2, arg3)
		arg3[2](arg2, arg1[23])
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[37] = function(s1)
		error("devirt: index nil @272,676217 - 272,676221 (at 0:22)")
	end,
	[544] = buffer,
	[129] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:10)")
	end,
	[7] = "IsClient",
	[599] = function()
		error("devirt: index nil @272,651286 - 272,651290 (at 0:15)")
	end,
	[668] = function()
		local s3 = function(...)
			error("devirt: could not lift closure: closure maker did not return the VM closure")
		end
		error("devirt: index nil @272,644909 - 272,644913 (at 0:5)")
	end,
	[36] = function()
		error("devirt: arith on None None (at 0:33)")
	end,
	[335] = function()
		error("devirt: index nil @272,696337 - 272,696341 (at 0:5)")
	end,
	[411] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:9)")
	end,
	[568] = function(arg1, arg2, s3, s4)
		if not (arg2 > 76) then
			s4[50][58] = s3[68]
			return 340
		end
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[625] = "__index",
	[483] = Random,
	[96] = function()
		local s4 = function()
			error("devirt: index nil @272,636175 - 272,636179 (at 0:5)")
		end
		error("devirt: newindex None (at 0:6)")
	end,
	[419] = function(s1)
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[166] = string.sub,
	[66] = function(s1, s2, s3)
		if s3 ~= 47 then
			if s3 ~= 66 then
				error("devirt: index nil @272,676217 - 272,676221 (at 0:12)")
			end
			s1[491](s1)
			error("devirt: call of unknown VM function lf141 (at 0:29)")
		end
		s2[19] = s1[125]
		s2[10] = nil
		error("devirt: index nil @272,644909 - 272,644913 (at 0:16)")
	end,
	[642] = function(s1)
		error("devirt: arith on None None (at 0:7)")
	end,
	[119] = string.find,
	[23] = "unpack",
	[687] = string.gsub,
	[563] = function()
		local s3 = function()
			if select("#", ...) == 0 then
			end
		end
		error("devirt: index nil @272,644909 - 272,644913 (at 0:7)")
	end,
	[531] = function(s1, arg2, s3, s4, arg5, s6)
		if not (arg2 <= 16) then
			error("devirt: index nil @272,690960 - 272,690964 (at 0:16)")
		end
		error("devirt: call of unknown VM function lf141 (at 0:12)")
	end,
	[217] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[306] = function()
		error("devirt: index nil @272,675771 - 272,675775 (at 0:7)")
	end,
	[360] = function(arg1, s2)
		error("devirt: newindex None (at 0:32)")
	end,
	[260] = function(s1, s2, s3, s4, s5, s6)
		if not (s5 > 108) then
			if s5 < 91 then
				if s5 > 1 then
					error("devirt: index nil @272,676217 - 272,676221 (at 0:78)")
				end
			end
			if s5 < 69 then
				error("devirt: index nil @272,676217 - 272,676221 (at 0:45)")
			end
			if s5 < 108 then
				if s5 > 69 then
					error("devirt: call of unknown VM function lf141 (at 0:27)")
				end
			end
			if s5 < 126 then
				if s5 > 91 then
					error("devirt: index nil @272,690960 - 272,690964 (at 0:16)")
				end
			end
		else
			s3 = s1[212]
			s5 = 69
		end
		error("devirt: call of unknown VM function lf141 (at 0:33)")
	end,
	[263] = function()
		error("devirt: arith on None None (at 0:14)")
	end,
	[224] = function(s1, s2, arg3, s4)
		if s2 ~= 85 then
			if s2 ~= 123 then
				return nil
			end
			error("devirt: index nil @272,676217 - 272,676221 (at 0:15)")
		end
		error("devirt: index nil @272,644812 - 272,644816 (at 0:25)")
	end,
	[513] = function(s1, arg2, arg3, arg4, arg5, s6, arg7, arg8, s9, s10)
		if s10 ~= 106 then
			if s10 ~= 119 then
				if s10 ~= 120 then
					error("devirt: call of unknown VM function lf141 (at 0:46)")
				end
				error("devirt: index nil @272,676217 - 272,676221 (at 0:14)")
			end
			error("devirt: index nil @272,676217 - 272,676221 (at 0:41)")
		end
		error("devirt: call of unknown VM function lf141 (at 0:5)")
	end,
	[183] = function(s1, s2, arg3, s4, arg5, arg6, arg7, s8)
		local s10 = 61
		while true do
			if s10 < 120 then
				if s10 > 106 then
					s4[7] = s8[s1[449]]
					s10 = 106
					continue
				end
			end
			if not (s10 > 119) then
				if not (s10 < 65) then
					if s10 < 106 then
						if s10 > 61 then
							error("devirt: index nil @272,644812 - 272,644816 (at 0:37)")
						end
					end
					if not (s10 < 119) then
						continue
					end
					if not (s10 > 65) then
						continue
					end
					error("devirt: call of unknown VM function lf141 (at 0:7)")
				end
				s10 = 120
				continue
			end
			break
		end
		error("devirt: index nil @272,644812 - 272,644816 (at 0:65)")
	end,
	[357] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[618] = "RunService",
	[415] = function(s1, arg2, s3, arg4, s5, s6, arg7, s8, s9)
		if not (s9 > 69) then
			if s9 < 96 then
				if s5 then
					error("devirt: newindex None (at 0:69)")
				end
			end
			error("devirt: index nil @272,676217 - 272,676221 (at 0:35)")
		end
		error("devirt: index nil @272,676217 - 272,676221 (at 0:46)")
	end,
	[144] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:9)")
	end,
	[622] = function()
		error("devirt: index nil @272,676217 - 272,676221 (at 0:6)")
	end,
	[177] = function(s1, s2, s3, arg4, s5, s6)
		if s2 ~= 98 then
			if s2 ~= 89 then
				if s2 ~= 79 then
					error("devirt: call of unknown VM function lf141 (at 0:35)")
				end
				s6[2](s5, s1[369])
				error("devirt: newindex None (at 0:23)")
			end
			s6[2](s3, s1[35])
			error("devirt: call of unknown VM function lf141 (at 0:19)")
		end
		error("devirt: index nil @272,676217 - 272,676221 (at 0:13)")
	end,
	[326] = function(arg1, arg2, s3)
		arg2(s3)
		error("devirt: index nil @272,676217 - 272,676221 (at 0:10)")
	end,
	[32] = function(s1)
		error("devirt: arith on None None (at 0:48)")
	end,
	[16] = function(s1, s2, s3, s4, s5, arg6, s7, s8, s9)
		if s3 ~= 189 then
			if s3 == 107 then
				error("devirt: index nil @272,676217 - 272,676221 (at 0:6)")
			end
		else
			s2 = (s7 * 65536 + s4) % 4294967296
		end
		error("devirt: call of unknown VM function lf141 (at 0:16)")
	end,
	[592] = rawset,
	[583] = table,
	[516] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:5)")
	end,
	[254] = "LayoutOrder",
	[392] = function(...)
		error("devirt: could not lift closure: TypeError: '<=' not supported between instances of 'NoneType' and 'NoneType'")
	end,
	[270] = function()
		error("devirt: index nil @272,644909 - 272,644913 (at 0:7)")
	end,
	[147] = function(s1, s2, s3, s4, arg5)
		if arg5 ~= 32 then
			s3[2](s2, s1[608])
			error("devirt: index nil @272,676217 - 272,676221 (at 0:26)")
		end
		s3[2](s4, s1[566])
		error("devirt: call of unknown VM function lf141 (at 0:6)")
	end,
	[331] = function(arg1, s2)
		local s3 = 8
		while true do
			if s3 < 71 then
				s2[7](s2[60])
				s3 = 71
				continue
			end
			if not (s3 > 8) then
				continue
			end
			break
		end
		error("devirt: index nil @272,644812 - 272,644816 (at 0:16)")
	end,
	[11] = "running",
	[74] = function()
		error("devirt: index nil @272,644812 - 272,644816 (at 0:6)")
	end,
	[534] = function()
		error("devirt: newindex None (at 0:6)")
	end,
	[134] = function(s1, s2, arg3, arg4, arg5, arg6)
		if not (arg6 > 38) then
			error("devirt: index nil @272,676217 - 272,676221 (at 0:6)")
		end
		s2:GetPositionOnCurve(0.375)
		error("devirt: call of unknown VM function lf141 (at 0:33)")
	end,
	[280] = function(s1)
		error("devirt: call of unknown VM function lf141 (at 0:17)")
	end,
}
local r3 = function()
	error("devirt: arith on None None (at 0:16)")
end
error("devirt: index nil @272,644909 - 272,644913 (at 0:630)")