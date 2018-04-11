.PHONY: build
build:
	docker build --no-cache -t parent parent
	docker build -t child child

.PHONY: test
test: test-parent-empty test-parent-empty-mkdir test-child-empty test-child-empty-mkdir
	@:

.PHONY: test-parent-empty
test-parent-empty:
	@echo "PARENT: /stuff dir created with COPY and deleted in parent should be empty:"
	@docker run --rm -i parent sh -c '[ ! -d /stuff ]' && echo "    OK" || ( echo "    FAIL" && docker run --rm -i parent sh -c 'ls -hal /stuff' )

.PHONY: test-parent-empty-mkdir
test-parent-empty-mkdir:
	@echo "PARENT: /stuff-mkdir dir created with 'mkdir' and deleted in parent should be empty:"
	@docker run --rm -i parent sh -c '[ ! -d /stuff-mkdir ]' && echo "    OK" || ( echo "    FAIL" && docker run --rm -i parent sh -c 'ls -hal /stuff-mkdir' )

.PHONY: test-child-empty
test-child-empty:
	@echo "CHILD: /stuff dir created with COPY and deleted in child should be empty:"
	@docker run --rm -i child sh -c '[ ! -d /stuff ]' && echo "    OK" || ( echo "    FAIL" && docker run --rm -i child sh -c 'ls -hal /stuff' )

.PHONY: test-child-empty-mkdir
test-child-empty-mkdir:
	@echo "CHILD: /stuff-mkdir dir created with 'mkdir' and deleted in child should be empty:"
	@docker run --rm -i child sh -c '[ ! -d /stuff-mkdir ]'  && echo "    OK" || ( echo "    FAIL" && docker run --rm -i child sh -c 'ls -hal /stuff-mkdir' )