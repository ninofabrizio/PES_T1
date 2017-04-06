-- AStar Algorithm in Lua
-- Author: Nino Fabrizio Tiriticco Lizardo
-- Version:
-- 		1		06/04/2017		-Implemented function to build a map
--								-Implemented function to print map
--								-Implemented function to generate random walls in the map

local map = {}
local height = 10
local width = 10

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

function buildMap()

	local heightLimit = height - 1
	local widthLimit = width - 1

	for i = 1, height do
    
    	map[i] = {}

    	for j = 1, width do

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

-- Main execution
buildMap()