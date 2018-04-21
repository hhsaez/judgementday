require 'assets/scripts/utils/debug_utils'

function createNodeGroup( group )
	group = group or {}
	group.type = group.type or 'crimild::Group'
	group.nodes = group.nodes or {}
	group.components = group.components or {}
	return group
end

function attachNodes( group, nodes )
	group.nodes = group.nodes or {}
	
	for _, node in ipairs( nodes ) do
		table.insert( group.nodes, node )
	end
end

function getNodeWithName( nodes, name )
	for _, n in ipairs( nodes ) do
		if n.name == name then
			return n
		end
	end
	
	return nil
end

function attachComponent( node, component )
	if ( node == nil ) then
		io.write( string.format( 'Invalid argument: node\n' ) )
		os.exit()
	end
	
	node.components = node.components or {}

	table.insert( node.components, component )

	return component
end

function getNodeComponent( node, componentType )
	if ( node == nil ) then
		io.write( string.format( 'Invalid argument: node\n' ) )
		os.exit()
	end
	
	node.components = node.components or {}
	
	for _, c in ipairs( node.components ) do
		if c.type == componentType then
			return c
		end
	end
	
	io.write(string.format('Error: No component found with type %s in \n%s\n', componentType, dump_table( node ) ) )
	os.exit()
end

