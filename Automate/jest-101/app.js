exports.getScore = (score) => {
    if (score >= 90) {
        return 'A';
    } else if (score >= 80) {
        return 'B';
    } else if (score >= 70) {
        return 'C';
    } else if (score >= 60) {
        return 'D';
    } else {
        return 'F';
    }
};


exports.testhello = (input) => {
    return 'Hello:' + input;
};


exports.fetchSomeData = () => {
    return new Promise(resolve => {
        setTimeout(() => resolve('success'), 100)
    })
}

exports.login = async () => {
    const response = await exports.fetchSomeData()
    return response === 'success'
}

