function dump_table( o )
	function dump_table_impl( o, level )
		local indentSpaces = ''
		for i = 1, level do
			indentSpaces = indentSpaces .. '   '
		end
		
		if type( o ) == 'table' then
			local s = '{\n'
			for k,v in pairs( o ) do
				if type( k ) ~= 'number' then k = '"' .. k .. '"' end
				s = s .. indentSpaces .. '   [' .. k .. '] = ' .. dump_table_impl( v, level + 1 ) .. ',\n'
			end
			return s .. indentSpaces .. '}'
		else
			return tostring( o )
		end
	end

	return dump_table_impl( o, 0 )
end
