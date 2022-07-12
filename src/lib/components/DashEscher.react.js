import React, {Component} from 'react';
import PropTypes from 'prop-types';
import Builder from 'escher'
import * as escher from 'escher'
import * as d3 from "d3";


/**
 * DashEscher visualizes a metabolic network using Escher Builder.
 * It takes two properties, `mapData` and `modelData`, and
 * displays the network.
 */
export default class DashEscher extends Component {
    constructor(props) {
        super(props);

        this.myReference = React.createRef();
    }

    renderEscherNetwork() {
        // Note: in the future, it may not be desirable to rerender the whole
        // canvas on every component update. Eg, some prop changes might not
        // warrant a full refresh. In that case, we can check for prop changes 
        // in componentDidUpdate.
        var container = d3.select(this.myReference.current);

        // Note: although I'd rather remove the child nodes directly (eg, by
        // iterating through the escherRef.current.children and calling ".remove"),
        // something goes wrong with the timing and the canvas is occasionally
        // duplicated. So we use d3, the same library escher uses, and it clears
        // properly.
        container.html("");

        var b = Builder(this.props.mapData, this.props.modelData, null, container, this.props.options)
    }

    componentDidMount() {
        this.renderEscherNetwork();
    }

    componentDidUpdate() {
        this.renderEscherNetwork();
    }

    render() {
        const {id, height, width} = this.props;

        return (
            <div id={id}>
                <div ref={this.myReference} style={{height: height, width: width}}></div>
            </div>
        );
    }
}

DashEscher.defaultProps = {};

DashEscher.propTypes = {
    /**
     * The ID used to identify this component in Dash callbacks.
     */
    id: PropTypes.string,

    /**
     * The metabolic network map.
     */
    mapData: PropTypes.array.isRequired,

    /**
     * The metabolic network model.
     */
    modelData: PropTypes.object,

    /**
     * Rendering options. Full list of options at
     * https://escher.readthedocs.io/en/latest/javascript_api.html
     */
    options: PropTypes.object,

    /** 
     * Width of the canvas.
     */
    width: PropTypes.string,

    /**
     * Height of the canvas.
     */
    height: PropTypes.string,

    /**
     * Dash-assigned callback that should be called to report property changes
     * to Dash, to make them available for callbacks.
     */
    setProps: PropTypes.func
};
