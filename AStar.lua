-- AStar Algorithm in Lua
-- Author: Nino Fabrizio Tiriticco Lizardo
-- Version:		Date:			Assignment:
-- 		1		06/04/2017		-Implemented function buildMap
--								-Implemented function printMap
--								-Included the symbol "." inside buildMap
--								-Implemented function generateRandomWalls
--		2		07/04/2017		-Implemented function estimateDistance
--								-Implemented function getNeighbors
--		3		08/04/2017		-Implemented function tableContains
--								-Implemented function insertInTable
--								-Implemented function removeFromTable
--								-Implemented function AStar, non-operational
--								-Implemented function tableLength
--		4		09/04/2017		-Removed function tableLength
--								-Fixed function tableContains
--								-Fixed function insertInTable
--								-Fixed function removeFromTable
--								-Fixed function AStar, still non-operational
--		5		10/04/2017		-Fixed function AStar, fully operational
--								-Implemented main part to show results
--								-Turned global variables into local
--								-Aplied better names by context to variables
--								-Complemented documentation
--								-Correction in index enumeration part in removeFromTable
--		6		11/04/2017		-Added a message to be shown in the console to warn when the map is being built
--								-Modified startPoint and finishPoint
--								-Updated buildMap to apply modifications above

-- Function that shows the map in the console.
-- Receives:
--		-"map": Table with the area where we navigate
--		-"height": Variable with height size of map
--		-"width": Variable with width size of map
-- Returns:
--		Nothing
function printMap( map, height, width )

	for index = 1, height do
    	for jIndex = 1, width do
    		io.write(map[index][jIndex][1])
    		io.write(" ")
    	end
    	io.write("\n")
    end
    io.write("\n")
end

-- Function that puts "walls" in random locations inside the map, only where possible.
-- Replaces a valid position ('.') with a wall ('W'). Uses a simple and not very efficient way to
-- check if the whole number of walls in "maxWallNum" can be put inside the map.
-- Receives:
--		-"map": Table with the area where we navigate
--		-"heightLimit": Variable with the limit permited by height in map
--		-"widthLimit": Variable with the limit permited by width in map
-- Returns:
--		Nothing
function generateRandomWalls( map, heightLimit, widthLimit )

	local maxWallNum = 20

	-- Just a (bad) way to avoid a possible infinite loop if there's no way to put more walls in the map
	local maxNumTries = heightLimit * widthLimit

	while maxWallNum > 0 do

		local xPos
		local yPos

		repeat
			math.randomseed(os.time())
			math.random(); math.random(); math.random()
			xPos = math.random(2, heightLimit)
			math.random(); math.random(); math.random()
			yPos = math.random(2, widthLimit)
		until map[xPos][yPos][1] == '.'

		for index = 2, heightLimit do

			local validPosition = false

			if index ~= xPos and map[index][yPos][1] == '.' then

				for jIndex = 2, widthLimit do
					if jIndex ~= yPos and map[xPos][jIndex][1] == '.' then
						map[xPos][yPos][1] = 'W'
						validPosition = true
						break
					end
				end
			end

			if validPosition then
				maxWallNum = maxWallNum - 1
				break
			end
    	end

    	maxNumTries = maxNumTries - 1

    	if maxNumTries == 0 then
    		break
    	end
	end
end

-- Function that puts most of the info inside the map.
-- I already initialize needed values for the A Star logic here to evade problems later
-- Receives:
--		-"map": Table with the area where we navigate
--		-"height": Variable with height size of map
--		-"width": Variable with width size of map
--		-"startPoint": Table containing a tuple of coordinates from map; where navigation starts
--		-"finishPoint": Table containing a tuple of coordinates from map; where navigation ends
-- Returns:
--		Nothing
function buildMap( map, height, width, startPoint, finishPoint )

	local heightLimit = height - 1
	local widthLimit = width - 1

	for index = 1, height do
    
    	map[index] = {}

    	for jIndex = 1, width do

    		map[index][jIndex] = {}

    		if jIndex == 1 or jIndex == height or index == 1 or index == width then
        		map[index][jIndex][1] = 'W'
    		elseif index == startPoint[1] and jIndex == startPoint[2] then
    			map[index][jIndex][1] = 'S'
    		elseif index == finishPoint[1] and jIndex == finishPoint[2] then
    			map[index][jIndex][1] = 'X'
    		else
    			map[index][jIndex][1] = '.'
    		end

    		map[index][jIndex].DistanteToFinishPoint = -1
    		map[index][jIndex].DistanteFromStartPoint = -1
    	end
    end

    generateRandomWalls(map, heightLimit, widthLimit)

    print("\nOriginal map:")
    printMap(map, height, width)
end

-- Function carrying the heuristic's logic.
-- In this case is the Manhattan one which it's used to give us the distance between two points considering only horizontal and vertical moves.
-- Receives:
--		-"pointA": Table containing a tuple of coordinates from map
--		-"pointB": Table containing a tuple of coordinates from map
-- Returns:
--		-A numeric value representing the heuristic outcome
function estimateDistance( pointA, pointB )
	return (math.abs(pointA[1] - pointB[1]) + math.abs(pointA[2] - pointB[2]))
end

-- Function that checks available neighbors of a given position.
-- Receives:
--		-"currentPosition": Table containing a tuple of coordinates from map; the current position of the navigation
--		-"map": Table with the area where we navigate
--		-"finishPoint": Table containing a tuple of coordinates from map; where navigation ends
-- Returns:
--		-A table with all the available neihbors (which are tuple of coordinates). Notice that there's a chance of no
--		 available neighbors, in this case the table will be returned empty
function getNeighbors( currentPosition, map, finishPoint )

	local neighbors = {}
	local index = 1

	if (finishPoint[1] == (currentPosition[1] - 1) and finishPoint[2] == currentPosition[2])
			or map[currentPosition[1] - 1][currentPosition[2]][1] == '.' then
		neighbors[index] = {}
		neighbors[index][1] = currentPosition[1] - 1
		neighbors[index][2] = currentPosition[2]
		index = index + 1
	end

	if (finishPoint[1] == (currentPosition[1] + 1) and finishPoint[2] == currentPosition[2])
			or map[currentPosition[1] + 1][currentPosition[2]][1] == '.' then
		neighbors[index] = {}
		neighbors[index][1] = currentPosition[1] + 1
		neighbors[index][2] = currentPosition[2]
		index = index + 1
	end

	if (finishPoint[1] == currentPosition[1] and finishPoint[2] == (currentPosition[2] - 1))
			or map[currentPosition[1]][currentPosition[2] - 1][1] == '.' then
		neighbors[index] = {}
		neighbors[index][1] = currentPosition[1]
		neighbors[index][2] = currentPosition[2] - 1
		index = index + 1
	end

	if (finishPoint[1] == currentPosition[1] and finishPoint[2] == (currentPosition[2] + 1))
			or map[currentPosition[1]][currentPosition[2] + 1][1] == '.' then
		neighbors[index] = {}
		neighbors[index][1] = currentPosition[1]
		neighbors[index][2] = currentPosition[2] + 1
	end

	return neighbors
end

-- Function to see if the content of a table it's part of another.
-- Receives:
--		-"table": Table containing tuples of coordinates from map; the one that interest us to check. Notice that
--		 it can be empty or non-existent.
--		-"value": Table containing a tuple of coordinates from map; the one we use to compare
-- Returns:
--		-"true": If the table has the content checked
--		-"false": If the table doesn't has the content checked
function tableContains( table, value )

	if table ~= nil and #table > 0 then
		for index = 1, #table do
			if table[index][1] == value[1] and table[index][2] == value[2] then
				return true
			end
		end
	end

	return false
end

-- Function to insert contents from a table to another, in case it's not there already.
-- Receives:
--		-"table": Table containing tuples of coordinates from map; the one that interest us to check. Notice that
--		 it can be empty or non-existent.
--		-"value": Table containing a tuple of coordinates from map; the one we use to compare
-- Returns:
--		Nothing
function insertInTable( table, value )

	if not tableContains(table, value) then

		local index = 1

		if table == nil then
			table = {}
		elseif next(table) ~= nil then
			index = #table + 1
		end

		table[index] = {}
		table[index][1] = value[1]
		table[index][2] = value[2]
	end
end

-- Function to remove the equivalent content of a table from another, if it's there.
-- The way I remove it needs me to reenumerate the content inside the table, when removed something sucessfully, given
-- that they don't reenumerate by themselves. If this is not done, it causes huge problems with future iteractions in the table.
-- Receives:
--		-"table": Table containing tuples of coordinates from map; the one that interest us to check. Notice that
--		 it can be empty or non-existent.
--		-"value": Table containing a tuple of coordinates from map; the one we use to compare
-- Returns:
--		Nothing
function removeFromTable( table, value )

	if tableContains(table, value) then

		local removed = false

		for index = 1, #table do
			if table[index][1] == value[1] and table[index][2] == value[2] then
				table[index] = nil
				removed = true
				break
			end
		end

		if removed then

			local index = 1
			
			for key, value in pairs(table) do
				
				if key ~= index then
					table[index] = value
					table[key] = nil
				end
				index = index + 1
			end
		end
	end
end

-- Function with the AStar algorithm logic.
-- Uses a table for positions to visit, visited ones, neighbors for the current position of the navigation and
-- 4 values in each component of the map table needed to find the best path
-- Receives:
--		-"map": Table with the area where we navigate
--		-"startPoint": Table containing a tuple of coordinates from map; where navigation starts
--		-"finishPoint": Table containing a tuple of coordinates from map; where navigation ends
-- Returns:
--		-Empty table: When this happens, it means the finish point is totally unreachable. In other words,
--		 there isn't at least an able position ('.') between the obstacles ('W') from start ('S') to finish line ('X')
--		-"path": Table containing the tuples of coordinates conected from start to finish
function AStar( map, startPoint, finishPoint )

	local open = {}
	local closed = {}
	local neighbors
	local path = {}

	map[startPoint[1]][startPoint[2]].DistanteFromStartPoint = 0
	map[startPoint[1]][startPoint[2]].Heuristic = estimateDistance(startPoint, finishPoint)
	map[startPoint[1]][startPoint[2]].DistanteToFinishPoint = map[startPoint[1]][startPoint[2]].Heuristic

	open[1] = {}
	open[1][1] = startPoint[1]
	open[1][2] = startPoint[2]

	while true do

		local currentPosition = {}

		if next(open) == nil then
			return {}
		end

		for index = 1, #open do
			if next(currentPosition) == nil or map[open[index][1]][open[index][2]].DistanteToFinishPoint < map[currentPosition[1]][currentPosition[2]].DistanteToFinishPoint then
				currentPosition[1] = open[index][1]
				currentPosition[2] = open[index][2]
			end
		end

		if currentPosition[1] == finishPoint[1] and currentPosition[2] == finishPoint[2] then
			break
		end

		removeFromTable(open, currentPosition)
		insertInTable(closed, currentPosition)

		neighbors = getNeighbors(currentPosition, map, finishPoint)

		for index = 1, #neighbors do

			local nextDistanceFromStartPoint = map[currentPosition[1]][currentPosition[2]].DistanteFromStartPoint + 1

			if nextDistanceFromStartPoint < map[neighbors[index][1]][neighbors[index][2]].DistanteFromStartPoint then

				removeFromTable(open, neighbors[index])
				removeFromTable(closed, neighbors[index])
			end

			if not tableContains(open, neighbors[index]) and not tableContains(closed, neighbors[index]) then

				map[neighbors[index][1]][neighbors[index][2]].DistanteFromStartPoint = nextDistanceFromStartPoint
				map[neighbors[index][1]][neighbors[index][2]].Heuristic = estimateDistance(neighbors[index], finishPoint)
				map[neighbors[index][1]][neighbors[index][2]].DistanteToFinishPoint = map[neighbors[index][1]][neighbors[index][2]].DistanteFromStartPoint + map[neighbors[index][1]][neighbors[index][2]].Heuristic
				map[neighbors[index][1]][neighbors[index][2]].Parent = {}
				map[neighbors[index][1]][neighbors[index][2]].Parent[1] = currentPosition[1]
				map[neighbors[index][1]][neighbors[index][2]].Parent[2] = currentPosition[2]
				insertInTable(open, neighbors[index])
			end
		end
	end

	currentPosition = finishPoint

	-- Each position is connect to the parent of origin, so I just navigate from finish to start to find the path
	while map[currentPosition[1]][currentPosition[2]].Parent ~= nil do
		insertInTable(path, currentPosition)
		currentPosition = map[currentPosition[1]][currentPosition[2]].Parent
	end

	insertInTable(path, startPoint)

	return path
end

-- Main execution
local map = {}
local height = 15
local width = 15
local startPoint = {}
startPoint[1] = height - 1
startPoint[2] = 2
local finishPoint = {}
finishPoint[1] = 2
finishPoint[2] = width - 1

print("\nBuilding map, please wait...")
buildMap(map, height, width, startPoint, finishPoint)

local path = AStar(map, startPoint, finishPoint)

if next(path) == nil then
	print("\nFinish point impossible to reach!")
else
	print("\nNumber of steps taken: ", (#path - 1))

	for index = 1, #path do
		if map[path[index][1]][path[index][2]][1] == '.' then
			map[path[index][1]][path[index][2]][1] = 'v'
		end
	end

	print("\nMap with path taken:")
	printMap(map, height, width)
end