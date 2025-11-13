NAME ?= fischchain
KEY  ?= myfuji

.PHONY: put local deploy-fuji describe validate health clean

put:
	@scripts/put-configs.sh $(NAME)

local: put
	@KEY=$(KEY) scripts/deploy-local.sh $(NAME)

deploy-fuji: put
	@KEY=$(KEY) scripts/deploy-fuji.sh $(NAME)

describe:
	@scripts/describe.sh $(NAME)

validate:
	@scripts/validate-configs.sh

health:
	@./scripts/describe.sh $(NAME) | sed -n 's/.*RPC URL:[[:space:]]*//p' | head -1 | xargs -I{} ./scripts/rpc-health.sh {}

clean:
	-@avalanche blockchain delete $(NAME) --yes >/dev/null 2>&1 || true