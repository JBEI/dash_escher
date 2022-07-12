import json

import dash_escher
import dash
from dash.dependencies import Input, Output
from dash import dcc, html

app = dash.Dash(__name__)

with open('tests/e_coli_core_map.json', 'r') as f:
    MAP_DATA = json.load(f)
with open('tests/e_coli_core_model.json', 'r') as f:
    MODEL_DATA = json.load(f)

app.layout = html.Div([
    html.H4("Metabolic Network", className="card-title"),
    html.Div(id="escher"),
    dcc.Input(
        id='pgi-input',
        type='number',
        placeholder='Flux through PGI reaction',
        min=0,
        max=50,
        step=1,
        value=3,
    ),
])


@app.callback(
    Output(component_id='escher', component_property='children'),
    Input(component_id='pgi-input', component_property='value')
)
def update_output_div(pgi_slider):
    return dash_escher.DashEscher(
        mapData=MAP_DATA,
        modelData=MODEL_DATA,
        options={
            'full_screen_button': True,
            'menu': 'zoom',
            'reaction_data': {
                'GLCpts': 30,
                'PGI': pgi_slider,
                'PFK': 5
            },
        },
        height='400px',
        width='100%',
    ),


if __name__ == '__main__':
    app.run_server(debug=True)
