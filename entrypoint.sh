#!/bin/bash
if [ "$RUN_PYTHON" = "1" ]; then
    exec python3 "$@"
else
    exec node "$@"
fi
