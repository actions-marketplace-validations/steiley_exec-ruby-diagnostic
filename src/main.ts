import * as core from '@actions/core';
import * as exec from '@actions/exec';

exec.exec('/home/runner/work/_actions/steiley/exec-ruby-diagnostic/master/bin/main.sh')
    .catch(e => core.setFailed(e.message));
