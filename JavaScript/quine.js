function replicate() { var it = "function replicate() { var it = \"itself\"; return it.replace('itself', it.replace(/\\\\/g, \"\\\\\\\\\").replace(/\"/g, '\\\\\"')); }"; return it.replace('itself', it.replace(/\\/g, "\\\\").replace(/"/g, '\\"')); }