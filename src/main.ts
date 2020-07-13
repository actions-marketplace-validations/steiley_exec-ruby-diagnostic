import * as core from '@actions/core';
import * as exec from '@actions/exec';

exec.exec(`${__dirname}/main.sh`)
    .catch(e => core.setFailed(e.message));
