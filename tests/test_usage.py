import time

from dash.testing.application_runners import import_app


# Basic test for the component rendering.
# The dash_duo pytest fixture is installed with dash (v1.0+)
def test_render_component(dash_duo):
    # Start a dash app contained as the variable `app` in `usage.py`
    app = import_app('usage')
    dash_duo.start_server(app)

    def get_pgi_flux():
        # Get the generated component input with selenium
        # The html input will be a children of the #input dash component
        reaction_labels = dash_duo.find_elements('.reaction-label')

        for reaction in reaction_labels:
            if reaction.text.startswith('PGI'):
                break
        else:
            assert False, f'None of the {len(reaction_labels)} reaction labels started with PGI'

        return float(reaction.text.split(' ')[-1])

    assert get_pgi_flux() == 3

    pgi_input = dash_duo.find_element('#pgi-input')
    pgi_input.clear()
    pgi_input.send_keys('7')

    # This is ugly, but it does test the desired functionality.
    time.sleep(2)

    assert get_pgi_flux() == 37, 'Update failed'
