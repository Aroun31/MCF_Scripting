/*
*
*    File: fn_helpText.sqf
*    =====================
*    Author: [DA3F] Aroun Le BriCodeur.
*    ==================================
*    Description: * * * *
*
*/

private _parse = parseText format ["<t color='#ABABAB' size='1' align='center' >Bonjour :<br/><t/><t color='#FEFEFE' >%1<t/><br/><br/><t color='#ABABAB' >Quelques commandes utiles à la mission :<br/>(F1 pour revoir ce message)<t/><br/><br/><t color='#00F0F0' align='left' >Help :<t/><t color='#00FF00' align='right' >F1<t/><br/><t color='#00F0F0' align='left' >Save de vos infos :<t/><t color='#00FF00' align='right' >F3<t/><br/><t color='#00F0F0' align='left' >Menotter :<t/><t color='#00FF00' align='right' >SHIFT + C<t/><br/><t color='#00F0F0' align='left' >Démenotter :<t/><t color='#00FF00' align='right' >CTRL + C<t/><br/><t color='#00F0F0' align='left' >Coffre véhicule :<t/><t color='#00FF00' align='right' >C<t/><br/><t color='#00F0F0' align='left' >Farme :<t/><t color='#00FF00' align='right' >F<t/><br/><t color='#00F0F0' align='left' >Achat parcelle :<t/><t color='#00FF00' align='right' >ALT + F<t/><br/><t color='#00F0F0' align='left' >Menu escorte :<t/><t color='#00FF00' align='right' >Windows<t/><br/><t color='#00F0F0' align='left' >Ranger son arme :<t/><t color='#00FF00' align='right' >SHIFT + H<t/><br/><t color='#00F0F0' align='left' >Sortir son arme :<t/><t color='#00FF00' align='right' >Ctrl + H<t/><br/><br/><t align='center' color='#ABABAB' >Pense à configurer la mission dans les fichiers de config pour obtenir la difficulté et les ressources que tu souhaites<br/><br/>Bonne game sur une mission<br/>faite par :<t/><br/><t color='#FEFEFE' size='1.1'>Aroun Le BriCodeur<t/>", profileName];

hint _parse;