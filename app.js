import {MDCTextField} from '@material/textfield';
import {MDCRipple} from '@material/ripple';
import {MDCList} from "@material/list";
import {MDCTopAppBar} from "@material/top-app-bar";
import {MDCDrawer} from "@material/drawer";
import {MDCFormField} from '@material/form-field';
import {MDCCheckbox} from '@material/checkbox';
import {MDCDataTable} from '@material/data-table';
import {MDCSelect} from '@material/select';
import {MDCMenu} from '@material/menu';


var i = 0;

const buttons = [].map.call(document.querySelectorAll('.mdc-button'), function (el) {
    return new MDCRipple(el);
});

const textfields = [].map.call(document.querySelectorAll('.mdc-text-field'), function (tf) {
    return new MDCTextField(tf);
});

const lists = [].map.call(document.querySelectorAll('.mdc-list'), function (el) {
    return new MDCList(el);
});

for (i = 0; i < lists.length; i++) {
    lists[i].wrapFocus = true;
}

const dataTables = [].map.call(document.querySelectorAll('.mdc-data-table'), function (el) {
    return new MDCDataTable(el);
});

// because of one app bar we dont need a for loop for this below
const drawer = new MDCDrawer(document.querySelector('.mdc-drawer'));
const topAppBar = MDCTopAppBar.attachTo(document.querySelector('.mdc-top-app-bar'));
topAppBar.setScrollTarget(document.querySelector('.main-content'));
topAppBar.listen('MDCTopAppBar:nav', () => {
    drawer.open = !drawer.open;
});




