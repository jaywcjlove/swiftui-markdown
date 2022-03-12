marked.setOptions({
  highlight: (code, lang) => {
      const language = Prism.languages[lang];
      if (language) {
          return Prism.highlight(code, language, lang);
      }
      return code;
  },
});

const renderer = {
    listitem: (text, task, checked) => {
        const input = typeof checked == "boolean" ? `<input type="checkbox" disabled=""${checked ? ' checked=""' : ''} class="task-list-item-checkbox">`: '';
        const cls = typeof checked == "boolean" && typeof task === "boolean" ? 'class="task-list-item"' : ""
        return `<li ${cls}>${input} ${(text || '').replace(/^<.*?>\s/, '')}</li>`;
    }
}

marked.use({ renderer });

window.__markdown_preview_dom__ = document.getElementById('__markdown_preview__');

function markdownPreview(content) {
    __markdown_preview_dom__.innerHTML = marked.parse(content);
}

if (window.webkit) {
    window.webkit.messageHandlers.mdPreviewDidReady.postMessage(null);
    // __markdown_preview_dom__.innerHTML = JSON.stringify(typeof window.webkit.messageHandlers.mdPreviewDidReady)
}
