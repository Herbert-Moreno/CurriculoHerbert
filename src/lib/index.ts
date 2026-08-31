// place files you want to import through the `$lib` alias in this folder.

import { writable } from "svelte/store";
import { browser } from "$app/environment";

export let global_page = writable("landing");

import US_Json from './lang/en_us.json';
import ES_Json from './lang/es_es.json';
import PT_Json from './lang/pt_br.json';

let page_locale = "en-US";

if (browser) {
    page_locale = navigator.language;
}
export let text_localized = {};

switch (page_locale.split("-")[0]) {
    case "en":
        text_localized = US_Json;
        break;
    case "es":
        text_localized = ES_Json;
        break;
    case "pt":
        text_localized = PT_Json;
        break;
    default:
        text_localized = US_Json;
        break;
}