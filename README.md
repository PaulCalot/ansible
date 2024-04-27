# ansible - V1

NOTE: ce répertoire est un fork de 
- ansible : https://github.com/ThePrimeAgen/ansible 
- .dotfiles : https://github.com/ThePrimeAgen/.dotfiles
Adaptés à mes besoins et très simplifié pour le moment.

Pour voir ce qui pourrait être nécessaire pour l'adaptater à ses besoins, se référer à la fin de ce document, la difficulté étant certainement de comprendre ce qui a été fait et de l'adapter à ses besoins.

TODO :
- [ ] Revoir clean-env pour l'adapter à mes modifications
- [ ] s'assurer que les taches sont effectuées dans le bon ordre 
- [ ] le repo ansible est cloné en https, puisque le ssh n'est pas setup, il faudrait ajouter la modification de cela ensuite et le repasser en ssh
- [ ] nettoyer ce qui peut l'être, notamment j'ai souvent ajouté des taches de suppression pour être sûr que ça n'échoue pas si je refais tourner une seconde fois, mais ce n'est pas la façon canonique de faire en ansible 
- [ ] Ajouter à la fin du .bashrc `exec zsh` - chez moi changer le shell par défaut ne semblait pas fonctionner => à investiguer peut être
- [ ] Regarder les adaptations qui seraient nécessaires pour Debian
- [ ] (optionnel) Regarder les adaptations qui seraient nécessaires pour Windows
- [ ] (très optionnel) Regarder les adaptations qui seraient nécessaires pour Mac OS
- [ ] peut être ajouter zotero dans le Main Menu ?
- [ ] ajoute des conda.yml ou similaires pour re-setup mes env virutels conda rapidement, ou alors le faire automatiquement lorsque je clone un projet ?
- [ ] ajouter agent (UHK)
- [ ] ajouter drawio, Postman

Autre :
- [ ] à quoi sert le package-lock.json ? sans doute le même intérêt que le fichier du même nom sur les projets js
- [ ] à quoi sert le lsp.Dockerfile ? Puis-je le supprimer ? C'est peut être une installation particulère pour les besoins de ThePrimeAgen, inutile dans mon cas. (LSP = Language Server Protocol) => ce fichier semble identique à celui nvim, utilier dans build-dockers
- [ ] ThePrimeAgen utilise la même clef ssh pour tout, ce qui n'est pas mon cas... est-ce que ça pose problème ? Peut-être nettoyer de mon côté ? Je pense qu'un souci peut survenir si une telle clef est utilisée pour alle choper des projets pro etc., sinon par défaut : clef d'accès git perso (cf. local.yml)
- [ ] Stockage base KeePass, l'auteur stockait ses codes d'authentification / backup (google, discord) - en utilisant ansible-vault

Notes :
- j'ai pour le moment supprimé l'installation de nodes, je verrai plus tard
- j'ai mis la version de slack à jour sur la 4.37 (22/04/2024)
- de même, j'ai commenté l'installation de i3, que je ferai plus tard (également du fait que ça utilisait dconf qui me semblait trop avancé pour mes connaissances)
- j'ai également supprimé ce qui était de l'installation de nvidia

# Utilisation
Attention :
* il faut avoir setup son répertoire de dotfiles avant (le mien est : https://github.com/PaulCalot/.dotfiles)
* il faut avoir modifier les informations perso dans les tâches
* uniquement tester sur ubuntu - également sur 24.04 (version du 25/04/2024)

Note sur les clefs ssh: ayant plusieurs clefs ssh ainsi qu'un fichier de config, j'utilise un script [ansible_encrypt_ssh_keys](ansible_encrypt_ssh_keys.sh) qui encrypt le config et les clefs privées, avec le même mdp.

Sur une nouvelle machine, lancer le [ansible-run.sh](ansible-run.sh), selon votre version. J'ai également mis [ansible-run-ubuntu24_04.sh](ansible-run-ubuntu24_04.sh) qui permet l'installation de ansible sans erreur par la suite (le release file n'est pas encore dispo dans le ppa pour 24.04, ce qui créé des problèmes de sécurité ensuite, donc suite à l'installation de ansible, je supprime le ppa pour l'instant, je le rajouterai lorsqu'il sera dispo).

Cloner ensuite le répertoire ansible sous son `$HOME`.

Pour installer les dotfiles (taches avec tag: dotfiles):
```shell
ansible-playbook --tags dotfiles local.yml --ask-become-pass --ask-vault-pass
```
- `--ask-become-pass`: demandera le mdp pour devenir sudo
- `--ask-vault-pass`: le mdp de la vault pour traiter notamment les clefs ssh

En théorie, c'est tout ce qui est nécessaire.

Note sur les .dotfiles: on utilise stow qui vient créé des des symlinks depuis les fichiers dans .dotfiles vers son `$HOME`.

# Dev uniquement - docker
Attention : l'utilisation du script build-dockers ne fonctionne pas lorsque connecté au vpn / réseau de l'entreprise, certainement bloqué par le pare-feu ou à cause de problèmes de DNS.
Je n'ai pas cherché de fix, la solution est de faire tourner le script à partir d'un partage de connexion de son portable. 

```shell
./build-dockers
docker run --rm -it new-computer bash 
```
Une fois le docker lancé :
```shell
ansible-playbook local.yml --ask-vault-pass
```

# Adaptation à son setup
- dans local.yml, modifier la clef ssh nécessaire pour setup son env, au besoin 
- Modifier les clefs et config dans le dossier .ssh
- Modifier les ids dans git-setup.yml
- Modifier le nom d'utilisteur dans le zsh-setup.yml
- Modifier le répertoire git dans dotfiles.yml (et évidemment avoir le sien pour faire toute cette partie là)
- projets perso également à mettre à jour
- et tout ce qui est installation de logiciels par défaut etc.
