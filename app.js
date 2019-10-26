
import { MDCTextField} from '@material/textfield';

const textfields = [].map.call( document.querySelectorAll('.mdc-text-field'), function(el) {
    return new MDCTextField(el);
});