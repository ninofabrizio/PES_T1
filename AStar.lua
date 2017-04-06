-- AStar Algorithm in Lua
-- Author: Nino Fabrizio Tiriticco Lizardo
-- Version:
-- 		1		06/04/2017		-Implemented function to build a map
--								-Implemented function to print map

local map = {}
local height = 10
local width = 10

function buildMap()

	local mapDimension = height * width

	for i = 1, height do
    
    	map[i] = {}

    	for j = 1, width do

    		if j == 1 or j == height then
        		map[i][j] = 'W'
    		elseif i == (height - 1) and j == 2 then
    			map[i][j] = 'I'
    		elseif i == 2 and j == (width - 1) then
    			map[i][j] = 'X'
    		else
    			map[i][j] = 'W'
    		end
    	end
    end

    printMap()
end

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

-- Main execution
buildMap()