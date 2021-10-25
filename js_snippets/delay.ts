async () => {
    await new Promise<void>((resolve) => {
        setTimeout(() => {
            console.log('-****- name', name);
            resolve();
        }, 1500);
    });
}
