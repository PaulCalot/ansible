# TODO:
**Le TODO.md est réalisé par l'auteur initial.**

Questions 
- l'installation se fait pour un ubuntu, est-ce ok sur debian ?
- à quoi sert le package-lock.json ? sans doute le même intérêt que le fichier du même nom sur les projets js
- à quoi sert le lsp.Dockerfile ? Puis-je le supprimer ? C'est peut être une installation particulère pour les besoins de ThePrimeAgen, inutile dans mon cas. (LSP = Language Server Protocol) => ce fichier semble identique à celui nvim, utilier dans build-dockers

Notes : 
- ThePrimeAgen utilise la même clef ssh pour tout, ce qui n'est pas mon cas... est-ce que ça pose problème ? Peut-être nettoyer de mon côté ? Je pense qu'un souci peut survenir si une telle clef est utilisée pour alle choper des projets pro etc., sinon par défaut : clef d'accès git perso (cf. local.yml)
- on pourrait stocker des codes d'authentification / backup (google, discord) - comme le faisait l'auteur. J'ai supprimé, dans un premier temps. Je pense que ça n'était pas utilisé autre part, mais c'était uniquement utile au cas où (et encrypté en utilisant ansible vault).
- j'ai déplacé les précédentes taches (*tasks*) de l'auteur dans old_tasks/, pour pouvoir m'en inspirer et m'y référer facilement en copiant-collant a besoin, car son installation est trop complexe pour mes besoins initiaux
- j'ai pour le moment supprimé l'installation de nodes, je verrai plus tard
- j'ai mis la version de slack à jour sur la 4.37 (22/04/2024)
- j'ai commenté le setup des projets perso, pour le moment
- le setup de nvim se fait version dev visiblement... (à vérifier de mon côté si c'est ok). Note : la config viendra avec les dotfiles. 
- de même, j'ai commenté l'installation de i3, que je ferai plus tard (également du fait que ça utilisait dconf qui me semblait trop avancé pour mes connaissances)
- j'ai également supprimé ce qui était de l'installation de nvidia

# Utilisation
Attention : il faut avoir setup son répertoire de dotfiles avant.
Egalement, il semblerarit que

Pour installer ansible, cf. le bash script [install](install):
```shell
./install
```

Pour installer les dotfiles (taches avec tag: dotfiles):
```shell
ansible-playbook -t dotfiles local.yml --ask-become-pass --ask-vault-pass
```

# Dev - docker
Attention : l'utilisation du script build-dockers ne fonctionne pas lorsque connecté au vpn / réseau de l'entreprise, certainement bloqué par le pare-feu ou à cause de problèmes de DNS.
Je n'ai pas cherché de fix, la solution est de faire tourner le script à partir d'un partage de connexion de son portable. 

```shell
./build-dockers
docker run --rm -it new-computer bash 
```
Une fois le docker lancé :
```shell
ansible-playbook local.yml
```

# Adaptation à son setup
- dans local.yml, modifier la clef ssh nécessaire pour setup son env, au besoin (/!\ a priori, ThePrimeAgen utilise la même clef pour tout....) 
- Modifier les clefs et config dans le dossier .ssh
- Modifier les ids dans git-setup.yml
- Modifier le nom d'utilisteur dans le zsh-setup.yml
- Modifier le répertoire git dans dotfiles.yml (et évidemment avoir le sien pour faire toute cette partie là)
