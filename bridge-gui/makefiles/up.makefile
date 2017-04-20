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
	echo 'build	- `up` docker <compositions> and <service> (optional) using given <env>' | fold -s

longdesc:
	echo 'Usage: `make up <composition> <env> [service]`' | fold -s
	echo ''
	echo 'Run `docker-compose up` for given docker <compositions> and <service> (optional) using given <env>' | fold -s
	echo ''
	echo 'Available compositions/envs/service'

%:
	if [ $(firstword $(MAKECMDGOALS)) == $@ ]; then \
		if [ $(words $(MAKECMDGOALS)) -lt 3 ]; then \
			docker-compose -f dockerfiles/$(word 1, $(MAKECMDGOALS))-$(word 2, $(MAKECMDGOALS)).yml up; \
		else \
			docker-compose -f dockerfiles/$(word 1, $(MAKECMDGOALS))-$(word 2, $(MAKECMDGOALS)).yml up $(word 3, $(MAKECMDGOALS)); \
		fi; \
	fi

.PHONY: % #all targets are phony
