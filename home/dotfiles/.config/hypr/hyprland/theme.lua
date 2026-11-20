local hl = hl

local function load()
    local file = io.open("/home/colin/.theme/colors", "rb")
    if not file then
        hl.notification.create({
            text = "Failed to open ~/.theme/colors.",
            timeout = 5000,
        })

        return {}
    end

    local content = file:read("*a")
    file:close()

    local theme = {}

    for ln in string.gmatch(content, "([^%s]+)") do
        local args = string.gmatch(ln, "([^=]+)")
        theme[args()] = args()
    end

    return theme
end

local theme = load()
if theme ~= {} then
    hl.config({
        general = {
            col = {
                active_border = "#" .. theme.accent,
                inactive_border = "#" .. theme.field,
            },
        },
    })
end
