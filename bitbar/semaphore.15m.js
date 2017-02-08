#!/usr/local/bin/node

/* jshint esversion: 6 */

const AUTH_TOKEN = process.env.SEMAPHORE_CI_AUTH_TOKEN;
const AUTHOR_NAME = 'James Newton';
const url = 'https://semaphoreci.com/api/v1/projects?auth_token=' + AUTH_TOKEN;
const https = require('https');

function color(result) {
    if (result == 'passed') {
        return 'green';
    } else if (result == 'pending') {
        return 'orange';
    } else {
        return 'red';
    }
}

function branchesOutput(branches) {
    branches = branches.filter(branch => {
        return branch.commit && branch.commit.author_name === AUTHOR_NAME;
    }).sort((a, b) => {
        return new Date(b.started_at) - new Date(a.started_at);
    });

    return branches.map(branch => {
        return `${branch.branch_name} | size=12 color=${color(branch.result)} href=${branch.build_url}`;
    }).join('\n');
}

function handleResponse(body) {
    let output = body.map(project => {
        return `${project.owner}/${project.name} | size=16 href=${project.html_url}\n${branchesOutput(project.branches)}`;
    }).join('\n---\n');

    console.log(`Semaphore CI\n---\n${output}`);
}

https.get(url, res => {
    let body = '';

    res.on('data', data => {
        body += data;
    });

    res.on('end', () => {
        handleResponse(JSON.parse(body));
    });
});

