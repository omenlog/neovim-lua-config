local utils = {}

function utils.merge(...)
    local result = {}
    local args = {...}
    for _, snippets_list in ipairs(args) do
        for _, snippet in ipairs(snippets_list) do
            table.insert(result, snippet)
        end
    end

    return result
end

return utils

