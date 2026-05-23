local M = {}

local data_file = vim.fn.stdpath("data") .. "/anchors.json"

-- Caché en memoria para el autocompletado
local cmp_items = {}

-- Helper para convertir "\n" literal a saltos de línea reales
local function unescape_payload(p)
    return p:gsub("\\n", "\n"):gsub("\\t", "\t")
end

-- Helper inverso para poder editar multilíneas en un input de 1 sola línea
local function escape_payload(p)
    return p:gsub("\n", "\\n"):gsub("\t", "\\t")
end

--- Funciones de Persistencia
local function load_anchors()
    local f = io.open(data_file, "r")
    if not f then
        return {}
    end
    local content = f:read("*a")
    f:close()
    if content == "" then
        return {}
    end
    return vim.fn.json_decode(content) or {}
end

-- Actualiza la caché del autocompletado formateando la sintaxis {}
local function update_completions()
    local anchors = load_anchors()
    cmp_items = {}
    for k, v in pairs(anchors) do
        local snip = v:gsub("([^\\]){}", "%1$1")
        if snip:sub(1, 2) == "{}" then
            snip = "$1" .. snip:sub(3)
        end
        snip = snip:gsub("\\{}", "{}")

        table.insert(cmp_items, {
            label = k,
            insertText = snip,
            insertTextFormat = 2, -- 2 = formato Snippet (soporta placeholders)
            kind = 15, -- 15 = icono de Snippet en el menú
            detail = "Custom Anchor",
            documentation = v,
        })
    end
end

local function save_anchors(data)
    local f = io.open(data_file, "w")
    if f then
        f:write(vim.fn.json_encode(data))
        f:close()
    end
    -- Refrescamos las sugerencias al instante en cada CRUD
    update_completions()
end

--- Función auxiliar para Snacks Picker
local function pick_anchor(action_fn, title)
    local anchors = load_anchors()
    local items = {}

    for k, v in pairs(anchors) do
        table.insert(items, { text = k, payload = v })
    end

    if #items == 0 then
        vim.notify("No hay anchors guardados.", vim.log.levels.WARN)
        return
    end

    Snacks.picker.pick({
        title = title,
        items = items,
        format = function(item, _)
            return {
                { item.text, "Title" },
                { " ➜ ", "Comment" },
                { escape_payload(item.payload), "String" }, -- Mostramos todo en 1 línea en la lista
            }
        end,
        -- Previewer blindado abriendo permisos de escritura temporalmente
        preview = function(ctx)
            if ctx.buf and vim.api.nvim_buf_is_valid(ctx.buf) then
                -- 1. Permitimos modificaciones en este buffer
                vim.bo[ctx.buf].modifiable = true

                local lines = vim.split(ctx.item.payload, "\n", { plain = true })
                vim.api.nvim_buf_set_lines(ctx.buf, 0, -1, false, lines)

                -- 2. Volvemos a bloquear el buffer por seguridad
                vim.bo[ctx.buf].modifiable = false
                vim.bo[ctx.buf].filetype = "text"
            end
        end,
        confirm = function(picker, item)
            picker:close()
            if item then
                action_fn(item)
            end
        end,
    })
end

--- Operaciones CRUD
M.anchor_new = function()
    vim.ui.input({ prompt = "Nombre del Anchor (ej. red): " }, function(name)
        if not name or name == "" then
            return
        end

        -- Limpiamos espacios invisibles y cualquier "~" extra, forzando un solo "~"
        name = vim.trim(name):gsub("~+$", "")

        vim.ui.input({ prompt = "Payload (usa \\n para saltos y {} para cursor): " }, function(payload)
            if not payload or payload == "" then
                return
            end
            local anchors = load_anchors()
            anchors[name] = unescape_payload(payload)
            save_anchors(anchors)
            vim.notify("Anchor '" .. name .. "' guardado con éxito.", vim.log.levels.INFO)
        end)
    end)
end

M.anchor_list = function()
    pick_anchor(function(item)
        local payload = item.payload
        local snip = payload:gsub("([^\\]){}", "%1$1")
        if snip:sub(1, 2) == "{}" then
            snip = "$1" .. snip:sub(3)
        end
        snip = snip:gsub("\\{}", "{}")
        vim.snippet.expand(snip)
    end, "Insertar Anchor")
end

M.anchor_update = function()
    pick_anchor(function(item)
        vim.ui.select(
            { "Name", "Payload", "Both" },
            { prompt = "Actualizar en '" .. item.text .. "':" },
            function(choice)
                if not choice then
                    return
                end
                local anchors = load_anchors()
                local current_name = item.text
                local current_payload = item.payload

                local function do_update(new_name, new_payload)
                    if new_name ~= current_name then
                        anchors[current_name] = nil
                    end
                    anchors[new_name] = new_payload
                    save_anchors(anchors)
                    vim.notify("Anchor actualizado.", vim.log.levels.INFO)
                end

                if choice == "Name" or choice == "Both" then
                    vim.ui.input({ prompt = "Nuevo Nombre: ", default = current_name }, function(new_name)
                        if not new_name or new_name == "" then
                            return
                        end

                        -- Limpiamos al actualizar el nombre también
                        new_name = vim.trim(new_name):gsub("~+$", "") .. "~"

                        if choice == "Both" then
                            vim.ui.input(
                                { prompt = "Nuevo Payload: ", default = escape_payload(current_payload) },
                                function(new_payload)
                                    if new_payload and new_payload ~= "" then
                                        do_update(new_name, unescape_payload(new_payload))
                                    end
                                end
                            )
                        else
                            do_update(new_name, current_payload)
                        end
                    end)
                elseif choice == "Payload" then
                    vim.ui.input(
                        { prompt = "Nuevo Payload: ", default = escape_payload(current_payload) },
                        function(new_payload)
                            if new_payload and new_payload ~= "" then
                                do_update(current_name, unescape_payload(new_payload))
                            end
                        end
                    )
                end
            end
        )
    end, "Actualizar Anchor")
end

M.anchor_delete = function()
    pick_anchor(function(item)
        vim.ui.select({ "No", "Yes" }, { prompt = "Delete anchor " .. item.text .. "?" }, function(choice)
            if choice == "Yes" then
                local anchors = load_anchors()
                anchors[item.text] = nil
                save_anchors(anchors)
                vim.notify("Anchor eliminado.", vim.log.levels.INFO)
            end
        end)
    end, "Borrar Anchor")
end

--- AUTOCOMPLETADO SETUP
M.setup = function()
    update_completions()

    local has_cmp, cmp = pcall(require, "cmp")
    if has_cmp then
        local source = {}
        function source:complete(_, callback)
            callback({ items = cmp_items, isIncomplete = false })
        end
        cmp.register_source("my_anchors", source)

        local config = cmp.get_config()
        local found = false
        for _, s in ipairs(config.sources) do
            if s.name == "my_anchors" then
                found = true
                break
            end
        end
        if not found then
            table.insert(config.sources, { name = "my_anchors" })
            cmp.setup(config)
        end
    end
end

M.new = function()
    return setmetatable({}, { __index = M })
end

function M:get_completions(context, callback)
    callback({
        is_incomplete_forward = false,
        is_incomplete_backward = false,
        items = cmp_items,
    })
end

return M
