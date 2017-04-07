-- AStar Algorithm in Lua
-- Author: Nino Fabrizio Tiriticco Lizardo
-- Version:		Date:			Assignment:
-- 		1		06/04/2017		-Implemented function buildMap
--								-Implemented function printMap
--								-Included the symbol "." inside buildMap
--								-Implemented function generateRandomWalls
--		2		07/04/2017		-Implemented function estimateDistance
--								-Implemented function getNeighbors

-- Initial info regarding the map
local map = {}
local height = 10
local width = 10
local startPoint = {}
startPoint[1] = 9
startPoint[2] = 2
local finishPoint = {}
finishPoint[1] = 2
finishPoint[2] = 9

-- Function that shows the map in the console
function printMap()

	for i = 1, height do
    	for j = 1, width do
    		io.write(map[i][j])
    		io.write(" ")
    	end
    	io.write("\n")
    end
    io.write("\n")
end

-- Function that puts "walls" in random locations inside the map, only where possible
function generateRandomWalls( heightLimit, widthLimit )

	local maxWallNum = 10

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
		until map[xPos][yPos] == '.'

		for i = 2, heightLimit do

			local validPosition = false

			if i ~= xPos and map[i][yPos] == '.' then

				for j = 2, widthLimit do
					if j ~= yPos and map[xPos][j] == '.' then
						map[xPos][yPos] = 'W'
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

-- Function that puts most of the info inside the map
function buildMap()

	local heightLimit = height - 1
	local widthLimit = width - 1

	for i = 1, height do
    
    	map[i] = {}

    	for j = 1, width do

    		map[i][j] = {}

    		if j == 1 or j == height or i == 1 or i == width then
        		map[i][j] = 'W'
    		elseif i == heightLimit and j == 2 then
    			map[i][j] = 'S'
    		elseif i == 2 and j == widthLimit then
    			map[i][j] = 'X'
    		else
    			map[i][j] = '.'
    		end
    	end
    end

    generateRandomWalls(heightLimit, widthLimit)

    printMap()
end

-- Function that returns the distance heuristic, in this case is the Manhattan one which it's used to give us the distance between two points considering only horizontal and vertical paths
function estimateDistance(pointA, pointB)
	return (math.abs(pointA[1] - pointB[1]) + math.abs(pointA[2] - pointB[2]))
end

-- Function that returns a list with the possible neighbors of a given position
function getNeighbors(currentPosition)

	local neighbors = {}

	if finishPoint[1] == (currentPosition[1] - 1) and finishPoint[2] == currentPosition[2]
			or map[currentPosition[1] - 1][currentPosition[2]] == '.' then
		neighbors.North = true
	else
		neighbors.North = false
	end

	if finishPoint[1] == (currentPosition[1] + 1) and finishPoint[2] == currentPosition[2]
			or map[currentPosition[1] + 1][currentPosition[2]] == '.' then
		neighbors.South = true
	else
		neighbors.South = false
	end

	if finishPoint[1] == currentPosition[1] and finishPoint[2] == (currentPosition[2] - 1)
			or map[currentPosition[1]][currentPosition[2] - 1] == '.' then
		neighbors.West = true
	else
		neighbors.West = false
	end

	if finishPoint[1] == currentPosition[1] and finishPoint[2] == (currentPosition[2] + 1)
			or map[currentPosition[1]][currentPosition[2] + 1] == '.' then
		neighbors.East = true
	else
		neighbors.East = false
	end

	return neighbors
end

-- Main execution
buildMap()