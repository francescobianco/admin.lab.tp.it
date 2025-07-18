
push:
	@git add .
	@git commit -am "Deploy" || true
	@git push

piku-init:
	@curl -sL https://raw.githubusercontent.com/piku/piku/refs/heads/master/piku > $$HOME/.local/bin/piku
	@chmod +x $$HOME/.local/bin/piku
	@git remote remove piku >/dev/null 2>&1 || true
	@git remote add piku piku@piku.lab.tp.it:admin-lab-tp-it

piku-deploy: push
	@git push piku main

piku-logs:
	@ssh piku@piku.lab.tp.it logs admin-lab-tp-it
