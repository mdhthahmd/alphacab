import { MDCTextField} from '@material/textfield';
import {MDCRipple} from '@material/ripple';
import {MDCList} from "@material/list";
import {MDCTopAppBar} from "@material/top-app-bar";
import {MDCDrawer} from "@material/drawer";
import {MDCFormField} from '@material/form-field';
import {MDCCheckbox} from '@material/checkbox';
import {MDCDataTable} from '@material/data-table';
import {MDCSelect} from '@material/select';
import {MDCMenu} from '@material/menu';

import {MDCSnackbar} from '@material/snackbar';
const snackbar = new MDCSnackbar(document.querySelector('.mdc-snackbar'));

import {MDCDialog} from '@material/dialog';
const dialog = new MDCDialog(document.querySelector('.mdc-dialog'));

const menu = new MDCMenu(document.querySelector('.mdc-menu'));
menu.open = true;

var i = 0;

const buttons = [].map.call(document.querySelectorAll('.mdc-button'), function (el) {
    return new MDCRipple(el);
});

const textfields = [].map.call(document.querySelectorAll('.mdc-text-field'), function (el) {
    return new MDCTextField(el);

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

//const checkbox = new MDCCheckbox(document.querySelector('.mdc-checkbox'));
//const formField = new MDCFormField(document.querySelector('.mdc-form-field'));
//formField.input = checkbox;

const selects = [].map.call(document.querySelectorAll('.mdc-select'), function (el) {
    return new MDCSelect(el);
});

for (i = 0; i < selects.length; i++) {
    selects[i].listen('MDCSelect:change', () => {
        alert(`Selected option at index ${selects[i].selectedIndex} with value "${selects[i].value}"`);
    });
}



