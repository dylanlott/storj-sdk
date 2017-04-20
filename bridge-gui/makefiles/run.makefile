.SILENT:
.DEFAULT:

help: using longdesc
	@echo '	TODO: list available "compositions"'
	@echo '	TODO: list available "services"'
	@echo '	TODO: list available envs'

using:
	#TODO: change `using` text based on set provider
	echo "using docker provider"

shortdesc:
	echo 'build	- `run` docker <compositions> and <service> (optional) using given <env>' | fold -s

longdesc:
	echo 'Usage: `make run <composition> <env> [service]`' | fold -s
	echo ''
	echo 'Run `docker-compose run` for given docker <compositions> and <service> (optional) using given <env>' | fold -s
	echo ''
	echo 'Available compositions/envs/service'

%:
	if [ $(firstword $(MAKECMDGOALS)) == $@ ]; then \
		if [ $(words $(MAKECMDGOALS)) -lt 4 ]; then \
			docker-compose -f dockerfiles/$(word 1, $(MAKECMDGOALS))-$(word 2, $(MAKECMDGOALS)).yml run $(word 3, $(MAKECMDGOALS)); \
		else \
			docker-compose -f dockerfiles/$(word 1, $(MAKECMDGOALS))-$(word 2, $(MAKECMDGOALS)).yml run $(word 3, $(MAKECMDGOALS)) $(word 4, $(MAKECMDGOALS)); \
		fi; \
	fi

.PHONY: % #all targets are phony
