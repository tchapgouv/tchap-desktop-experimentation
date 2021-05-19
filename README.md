<img src="https://tchap.gouv.fr/themes/tchap/img/logos/tchap-logo.svg" style="float: right;" width="60">

# Tchap client lourd

Ce guide explique comment générer un client lourd de Tchap.

La génération s'effectue avec [nativefier](https://github.com/jiahaog/nativefier), un module [nodejs](https://nodejs.org/fr/) qui permet d'embarquer un site web dans un émulateur chrome.

Cette méthode a été testée sous Debian 9 et Windows 10.

## Prérequis

- [`node`](https://nodejs.org/en/) >= 10
- [`yarn`](https://yarnpkg.com/package/yarn)

### Installation du module nativefier
`yarn global add nativefier`

## Génération du client
Pour commencer il faut récupérer le logo de Tchap qui servira d'icône au lanceur.

Le format de l’icône dépend du **système cible** :

- Linux : `.png` disponible [ici](https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/assets/tchap-logo.png)
- Windows : `.ico` disponible [ici](https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/assets/tchap-logo.ico)

Pour générer le client, se placer dans un répertoire contenant uniquement le dossier `assets/`, puis taper la commande suivante :

``` shell
nativefier --name "Tchap" --platform "windows" --arch "x64" --app-copyright "DINUM/MinArm" --conceal --icon "./assets/tchap-logo.ico" --counter --insecure --internal-urls ".*?tchap\.gouv\.fr.*?" --maximize --disable-context-menu --disable-dev-tools --single-instance --tray "https://www.tchap.gouv.fr/"
```

<br />
<br />

Les choix possibles pour l'option `--platform` sont les suivants :

- `osx`
- `linux`
- `windows`

Les choix possibles de l'option `--arch` sont les suivants :

- `ia32` : systèmes 32 bits
- `x64` : systèmes 64 bits

Certaines options utilisées dans la commande ci-dessus sont les suivantes :
- `--name` : Le nom de l'application
- `--icon` : Le logo de l'application
- `--platform` : La plateforme cible
- `--arch` : L'architecture cible
- `--maximize` : Lance l'application à la taille de l'écran
- `--disable-context-menu` : Désactive les menus par défaut de la fenêtre
- `--single-instance` : Permet d'autoriser seulement une instance. Si l'application est relancée, elle se réouvrira
- `--tray` : Permet à l'application d'être réduite dans la barre des tâches

Il est également possible d'utiliser les scripts suivants :
- Linux : [`tchap-desktop.sh`](https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/tchap-desktop.sh)
- Windows : [`tchap-desktop.bat`](https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/tchap-desktop.bat)

<br />

**Plus d'informations sur la commande à l'aide de `nativefier --help`**

Documentation hors ligne en pdf : [`tchap-desktop.pdf`](https://raw.githubusercontent.com/dinsic-pim/tchap-desktop/main/tchap-desktop.pdf)

<br />
<br />
<br />
<br />
<br />

<hr>
<span style="font-size: 8px; font-weight: bold;">DINUM/MinArm</span>
<span style="font-size: 8px;">Documentation mise à jour le 19/05/2021</span>
