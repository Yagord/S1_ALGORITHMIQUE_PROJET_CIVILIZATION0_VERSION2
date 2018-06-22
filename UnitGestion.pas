unit UnitGestion;

interface

uses GestionEcran, UnitMilitaire, UnitVille, System.SysUtils, UnitRecord,
  UnitAffichage;

procedure gestionCivilisation(var g: Game; var c: Civilisation);
// gere les actions a partir de l'ecran civilisation
procedure gestionAcceuil(var c: Char);
// gere les actions a partir du menu principal

implementation

procedure gestionMilitaire(var g: Game; var c: Civilisation);
var
  choix: Char; // caractere saisie par l'utilisateur
begin
  repeat
    choix := '&';
    afficheMilitaire(g, c);
    readln(choix);
    case choix of
      '1' .. '2':
        begin
          if c.recrutement > StrToInt(choix) - 1 then
          begin
            if choix = '1' then
            begin
              if c.ville.caserne > 0 then
                Recruter(c, StrToInt(choix))
              else
                messageGlobal := 'Aucune caserne';
            end;

            if choix = '2' then
            begin
              if c.ville.mine > 0 then
                Recruter(c, StrToInt(choix))
              else
                messageGlobal := 'Aucune mine';
            end;
          end
          else
          begin
            messageGlobal := 'Pas de point de recrutement';
          end;
        end;
      '3' .. '4':
        begin
          if c.soldat + c.canon > 0 then
          begin
            attaquerBarbare(g, c, StrToInt(choix) - 2);
          end
          else
          begin
            messageGlobal := 'Aucune troupe';
          end;
        end;
    end;
  until (choix = '0');
end;

procedure gestionVille(var g: Game; var v: ville);
var
  choix: Char; // caractere saisie par l'utilisateur
begin
  repeat
    afficheVille(g, v);
    readln(choix);

    if v.construction = -1 then
      v.construction := StrToInt(choix)
    else if (choix >='1') and (choix <='4') then

      messageGlobal := 'Impossible construction deja en cours'

    else if (v.ferme = 2) OR (v.mine = 3) OR (v.carriere = 3) OR (v.caserne = 3) then

      messageGlobal := 'Impossible, niveau max atteint.';

  until (choix = '0');
end;

procedure gestionCivilisation(var g: Game; var c: Civilisation);
var
  choix: Char; // caractere saisie par l'utilisateur
begin
  repeat
    choix := '&';
    afficheCivilisation(g, g.Civilisation);
    readln(choix);
    case choix of
      '1':
        gestionVille(g, g.Civilisation.ville);
      '2':
        gestionMilitaire(g, g.Civilisation);
      '0':
        g.fini := true;
    end;
  until (choix = '0') or (choix = '9');
end;

procedure gestionAcceuil(var c: Char);
var
  choix: Char; // caractere saisie par l'utilisateur
begin
  afficheAccueil;
  readln(c);
end;

end.
