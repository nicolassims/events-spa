#!/bin/bash

export MIX_ENV=prod
export port=8999

CFGD=$(readlink -f ~/.config/events_app)

if [ ! -e "$CFGD/base" ]; then
	echo "run deploy first"
	exit 1
fi

DP_PASS=$(cat "$CFGD/db_pass")
export DATABASE_URL=ecto://events:$DP_PASS@localhost/events_spa_prod

SECRET_KEY_BASE=$(cat "$CFGD/base")
export SECRET_KEY_BASE

_build/prod/rel/events_spa/bin/events_spa start
