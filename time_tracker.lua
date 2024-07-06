-- Get the Resolve application instance
resolve = Resolve()
projectManager = resolve:GetProjectManager()

-- Initialize tracking variables
local startTime = os.time()
local isTracking = false
local currentTool = nil
local logFilePath = "/path/to/my/resolve_log.csv"  -- Update this path

-- Function to log the time spent in each tool
function logTimeSpent(previousTool, duration)
    local logFile = io.open(logFilePath, "a")
    local currentProject = projectManager:GetCurrentProject()
    local projectName = currentProject and currentProject:GetName() or "No Project"
    local logEntry = string.format("%s,%s,%s,%d\n", os.date("%Y-%m-%d %H:%M:%S"), projectName, previousTool, duration)
    logFile:write(logEntry)
    logFile:close()
end

-- Main tracking loop
function trackTime()
    while isTracking do
        local newTool = resolve:GetCurrentPage()
        if newTool ~= currentTool then
            local endTime = os.time()
            local duration = endTime - startTime
            if currentTool then
                logTimeSpent(currentTool, duration)
            end
            currentTool = newTool
            startTime = endTime
        end
        os.execute("sleep 1")  -- Check every second
    end
end

function startTracking()
    if not isTracking then
        isTracking = true
        startTime = os.time()
        trackTime()
    end
end

startTracking()
