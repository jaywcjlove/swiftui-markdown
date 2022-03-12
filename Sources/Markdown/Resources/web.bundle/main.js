// marked.setOptions({
//     highlight: (code, lang) => {
//         if (lang && Prism.languages[lang]) {
//             const language = Prism.languages[lang];
//             return Prism.highlight(code, language, lang);
//         }
//         return code;
//     },
// });

marked.use({
    renderer: {
        code: (code, infostring, escaped) => {
            const language = Prism.languages[infostring];
            const codeHTML = language ? Prism.highlight(code, language, infostring) : code;
            const codeId = randomid();
            codeData[codeId] = code;
            const buttonElm = `<button type="button" class="icon copy-icon copied" onclick="copied(this, '${codeId}')">${copyElm}</button>`;
            return `<pre class="highlight"><code ${infostring ? `class="language-${infostring}"`: ''}>${codeHTML}</code>${buttonElm}</pre>`
        },
        listitem: (text, task, checked) => {
            const input = typeof checked == "boolean" ? `<input type="checkbox" disabled=""${checked ? ' checked=""' : ''} class="task-list-item-checkbox">`: '';
            const cls = typeof checked == "boolean" && typeof task === "boolean" ? 'class="task-list-item"' : ""
            return `<li ${cls}>${input} ${(text || '').replace(/^<.*?>\s/, '')}</li>`;
        }
    }
});

const copyElm = `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1000 1000" height="30" width="30" role="img">
<title>Copy to Clipboard</title>
<path d="M704 896H64V320h640v192h64V192c0-35-29-64-64-64H512C512 57 455 0 384 0S256 57 256 128H64c-35 0-64 29-64 64v704c0 35 29 64 64 64h640c35 0 64-29 64-64V768h-64v128zM192 192h64s64-29 64-64 29-64 64-64 64 29 64 64 32 64 64 64h64s64 29 64 64H128c0-39 28-64 64-64zm-64 512h128v-64H128v64zm448-128V448L320 640l256 192V704h320V576H576zM128 832h192v-64H128v64zm320-448H128v64h320v-64zM256 512H128v64h128v-64z"/>
</svg>
`;

window.__markdown_preview_dom__ = document.getElementById('__markdown_preview__');
const randomid = () => parseInt(String(Math.random() * 1e15), 10).toString(36);
const codeData = {};
const copied = (target, id) => {
    target.classList.add('active');
    copyTextToClipboard(codeData[id] || '', function() {
        var timer = setTimeout(() => {
            target.classList.remove('active');
            clearTimeout(timer);
        }, 2000);
    });
}
const markdownPreview = (content) => {
    __markdown_preview_dom__.innerHTML = marked.parse(content);
}


if (window.webkit) {
    window.webkit.messageHandlers.mdPreviewDidReady.postMessage(null);
    // __markdown_preview_dom__.innerHTML = JSON.stringify(typeof window.webkit.messageHandlers.mdPreviewDidReady)
}
