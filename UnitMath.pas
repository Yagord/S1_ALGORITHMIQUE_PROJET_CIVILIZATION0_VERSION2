unit UnitMath;

interface

function estPremier(nb: integer): boolean; // donne si nb est premier
function repetChar(c: char; count: integer): string; // repete count fois le caractere c
function pgcd(a: integer; b: integer): integer; // pgcd de a et b
function divSqrt(a: integer): integer; // c'est compliqué...
function abs(a: real): real; // valeur absolue de a

implementation

function repetChar(c: char; count: integer): string;
var
  i: integer;
  str: string;
begin
  str := '';
  for i := 1 to count do
  begin
    str := str + c;
  end;
  result := str;
end;

function estPremier(nb: integer): boolean;
var
  premier: boolean;
  i: integer;
begin
  premier := true;
  i := 2;
  while (premier) and (i < round(sqrt(nb)) + 1) do
  begin
    if nb mod i = 0 then
    begin
      premier := false;
    end;
    i := i + 1;
  end;
  if premier then
    result := true
  else
    result := false;

end;

function pgcd(a: integer; b: integer): integer;
begin
  if (a mod b = 0) then
    result := b
  else
    result := pgcd(b, a mod b);
end;

function abs(a: real): real;
begin
  if (a < 0) then
    result := -a
  else
    result := a;
end;

function divSqrt(a: integer): integer;

var
  stop: boolean;
  prec, i: integer;
  racine: real;

begin
  stop := false;
  i := 1;
  prec := 0;
  racine := sqrt(a);

  while not stop do
  begin
    if a mod i = 0 then
    begin
      if i >= racine then
      begin
        if racine - i < abs(racine - prec) then
        begin
          result := i;
          stop := true;
        end
        else
        begin
          result := prec;
          stop := true;
        end;
      end
      else
      begin
        prec := i;
        i := i + 1;
      end;
    end
    else
    begin
      prec := i;
      i := i + 1;
    end;
  end;

end;

end.
