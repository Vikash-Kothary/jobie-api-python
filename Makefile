.PHONY: requirements env build install tests examples clean-pyc clean-build

requirements:
	@echo 'Install requirements into a linux machine'
	sudo apt-get -y install python3-pip python3-venv vagrant
	#pip3 install --user --upgrade pip
	#pip3 install --user virtualenv
	vagrant plugin install vagrant-azure
	vagrant box add azure-deploy https://github.com/azure/vagrant-azure/raw/v2.0/dummy.box --provider azure
	# vagrant plugin install vagrant-aws
	# vagrant box add aws-deploy https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box
	

env:
	@echo 'Install requirements into virtualenv'
	python3 -m venv .venv
	.venv/bin/pip3 install -r requirements.txt
	#source .venv/bin/activate

build:
	@echo 'Build project'

install: build
	@echo 'Install project'

run:
	@echo 'Run project'
	python disruption_app/main.py

tests:
	@echo "Lol, it's a hackathon"

examples:
	@echo 'Run example notebooks'
	jupyter notebook --notebook-dir=./examples/

clean-pyc:
	find . -type d -name '__pycache__' -exec rm --force --recursive {} +
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	name '*~' -exec rm --force  {} 

clean-build:
	rm --force --recursive build/
	rm --force --recursive dist/
	rm --force --recursive *.egg-info
