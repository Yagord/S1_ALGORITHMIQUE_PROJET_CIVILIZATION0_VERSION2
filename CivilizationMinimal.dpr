program CivilizationMinimal;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  Windows,
  GestionEcran in 'GestionEcran.pas',
  UnitAffichage in 'UnitAffichage.pas',
  UnitUpdate in 'UnitUpdate.pas',
  UnitRecord in 'UnitRecord.pas',
  UnitInit in 'UnitInit.pas',
  UnitMath in 'UnitMath.pas',
  UnitGestion in 'UnitGestion.pas',
  UnitVille in 'UnitVille.pas',
  UnitMilitaire in 'UnitMilitaire.pas';

var
  Jeu: Game;
  choix: char;

begin

  repeat
    gestionAcceuil(choix); // menu accueil

    if choix = '1' then // si le joueur commence une partie
    begin
      initGame(Jeu); // initialisation du jeu

      while (Jeu.fini = false) do // boucle tant que le jeu n'est pas fini representant un tour de jeu
      begin
        gestionCivilisation(Jeu, Jeu.civilisation); // on gere notre civilisation

        updateGame(Jeu); // quand le tour est fini on update le jeu et recommence un tour
      end;
    end;
  until choix = '2';

end.
