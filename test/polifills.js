if (!ArrayBuffer['isView']) {
  console.log('NO EXiSTE')
  ArrayBuffer.isView = function(a) {
    return a !== null && typeof(a) === "object" && a['buffer'] instanceof ArrayBuffer;
  };
}
