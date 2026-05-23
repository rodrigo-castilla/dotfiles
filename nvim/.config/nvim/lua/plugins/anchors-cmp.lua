return {
    "saghen/blink.cmp",
    opts = function(_, opts)
        opts.sources.providers.my_anchors = {
            name = "Anchors",
            module = "util.my-anchors",
            score_offset = 100, -- Para que salgan arriba del todo
        }
        table.insert(opts.sources.default, "my_anchors")
    end,
}
