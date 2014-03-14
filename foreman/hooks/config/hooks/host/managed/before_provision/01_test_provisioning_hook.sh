#!/bin/bash

echo $2 finished building >/tmp/hook_before_provisioning

#HACK running puppet agent on foreman to trigger the build of icinga configs

sudo puppet agent -tv &>>/tmp/hook_before_provisioning

exit 0

