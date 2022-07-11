# AUTO GENERATED FILE - DO NOT EDIT

export dashescher

"""
    dashescher(;kwargs...)

A DashEscher component.
DashEscher visualizes a metabolic network using Escher Builder.
It takes two properties, `mapData` and `modelData`, and
displays the network.
Keyword arguments:
- `id` (String; optional): The ID used to identify this component in Dash callbacks.
- `height` (String; optional): Height of the canvas.
- `mapData` (Array; required): The metabolic network map.
- `modelData` (Dict; optional): The metabolic network model.
- `options` (Dict; optional): Rendering options. Full list of options at
https://escher.readthedocs.io/en/latest/javascript_api.html
- `width` (String; optional): Width of the canvas.
"""
function dashescher(; kwargs...)
        available_props = Symbol[:id, :height, :mapData, :modelData, :options, :width]
        wild_props = Symbol[]
        return Component("dashescher", "DashEscher", "dash_escher", available_props, wild_props; kwargs...)
end

