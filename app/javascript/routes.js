import * as p from './redux/platforms'
let routes = {}
// map action constants to regex patterns to test with
routes[p.LOAD_PLATFORMS]  = /platforms$/;
routes[p.LOAD_PLATFORM]   = /platforms\/(.+)/;

export default routes