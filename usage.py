import json

import dash_escher
import dash
from dash.dependencies import Input, Output
from dash import html

app = dash.Dash(__name__)

with open('tests/e_coli_core_map.json', 'r') as f:
    MAP_DATA = json.load(f)
with open('tests/e_coli_core_model.json', 'r') as f:
    MODEL_DATA = json.load(f)

app.layout = html.Div([
    dash_escher.DashEscher(
        id='input',
        mapData=MAP_DATA,
        modelData=MODEL_DATA,
        options={
            'full_screen_button': True,
            'menu': 'zoom',
            'reaction_data': {
                'GLCpts': 30,
                'PGI': 10,
                'PFK': 5
            },
        },
        height='300px',
        width='100%',
    ),
    html.Div(id='output')
])


if __name__ == '__main__':
    app.run_server(debug=True)
