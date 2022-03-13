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
    const options = {
        rewrite: (node, index, parent) => {
            const code = markdown.getCodeString(node.children)
            if (node.type == 'element' && node.tagName === 'pre') {
                const codeid = randomid();
                codeData[codeid] = code;
                node.children.push(copyElement(codeid));
            }
    
        }
    }
    __markdown_preview_dom__.innerHTML =  markdown.default(content, options);
}

if (window.webkit) {
    window.webkit.messageHandlers.mdPreviewDidReady.postMessage(null);
    // __markdown_preview_dom__.innerHTML = JSON.stringify(typeof window.webkit.messageHandlers.mdPreviewDidReady)
}
