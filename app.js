import { MDCTextField} from '@material/textfield';
import {MDCRipple} from '@material/ripple';
import {MDCList} from "@material/list";
import {MDCTopAppBar} from "@material/top-app-bar";
import {MDCDrawer} from "@material/drawer";


const buttons = [].map.call( document.querySelectorAll('.mdc-button'), function(el) {
    return new MDCRipple(el);
});

const textfields = [].map.call( document.querySelectorAll('.mdc-text-field'), function(el) {
    return new MDCTextField(el);
});


const list = MDCList.attachTo(document.querySelector('.mdc-list'));
list.wrapFocus = true;


const drawer = MDCDrawer.attachTo(document.querySelector('.mdc-drawer'));



const topAppBar = MDCTopAppBar.attachTo(document.querySelector('.mdc-top-app-bar'));
topAppBar.setScrollTarget(document.querySelector('.main-content'));
topAppBar.listen('MDCTopAppBar:nav', () => {
  drawer.open = !drawer.open;
});
