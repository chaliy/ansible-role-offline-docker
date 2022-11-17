init:
	poetry install

test: ## This will run galaxy tests
	poetry run ansible-playbook tests/test.yml -i tests/inventory --syntax-check
