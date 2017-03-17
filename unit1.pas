unit unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  StdCtrls, ExtCtrls, Buttons;
const Nfields= 40;
      NplayersPossible=8;
      cashperround= 200;// Geld beim Über los kommen

type
   //KLasse der Felder
  Tfield   = record
    typ            :   Integer;
    name           :   String[20];
    position       :   integer;
    hypothek       :   Boolean;
    price          :   integer;
    NstreatsofK    :   integer;//Number Streats of Typ or Color
    relatedstreets :   array[1..4] of integer;
    // Für Straßen wichtig
    owner          :   integer;
    pricetobuid    :   integer;
    color          :   Tcolor;
    Nhouses        :   integer;
    rent           :   array [0..5] of integer;
end;
  // Spieler Klasse
  Tplayer  = record
    ID            :    integer;
    name          :    string[40];
    money         :    integer;
    position      :    integer;
    Nownedstreets :    integer;
    streets       :    array [1..28] of integer;
    jailturns     :    integer;
    jailcards     :    integer;
    image         :    TImage;
end;
//Gesamte KLasse die das KOmplette Spiel enthält
Tgame    = record
  player        :    array[1..NplayersPossible]of Tplayer;
  fields        :    array[0..Nfields]of Tfield;
end;
//Karten Klasse
Tcard    = record
  Card          :    TImage;
  Houses        :    array[1..4] of TImage;
  Hotel         :    TImage;
end;
// Result Tat Klasse der function rolldice
Troll= record
  zahl1       :      integer;
  zahl2       :      integer;
  summe       :      integer;
  turns       :      integer;
  notgotojail :      boolean;

end;
//Result Tat Klasse der Function Orientation
Toriantation= record
  height     :     integer;
  width       :     integer;
end;

{TCardClick}


  { TForm1 }

  TForm1 = class(TForm)
    BUILD1: TButton;

    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button2: TButton;
    Button20: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    ColorDialog1: TColorDialog;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    ImageList1: TImageList;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label5: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label6: TLabel;
    Label60: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    OpenDialog1: TOpenDialog;
    strassenpannel: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    SaveDialog1: TSaveDialog;
    Start: TMenuItem;
    Timer1: TTimer;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure GroupBox1Click(Sender: TObject);
    procedure GroupBox2Click(Sender: TObject);
    procedure GroupBox3Click(Sender: TObject);
    procedure GroupBox5Click(Sender: TObject);
    procedure GroupBox6Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Label25Click(Sender: TObject);
    procedure Label46Click(Sender: TObject);
    procedure Label60Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure FieldCreate(Sender:TObject);
    procedure CardClick(Sender: TObject);
    procedure casjtransferbuy(Sender: TObject);
    procedure casjtransfermiete(Sender: TObject);
    procedure casjtransferbuildhous(Sender: TObject);
    procedure casjtransferdestroyhous(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure StreatInteraction(Sender: TObject; FieldID:Integer);
    procedure casjtransferhypotec(Sender: TObject);
    procedure Interactionspecialcards(Sender :TObject);
    procedure GrafikUserOutPut(Sender: TObject; FIELDID:integer);
    procedure move(Sender: Tobject; ID,distance: integer);
    procedure Timer1Timer(Sender: TObject);
    procedure Wuerefel( Sender: TObject);
    procedure casjtransfersellhous(Sender: TObject);



  private
    { private declarations }

  public

    { public declarations }
  end;

var
  Form1: TForm1;
  Nplayer   : integer;
  game      : file of Tgame;
  speicher  : file of String[255];
  play      : Tgame;
  Ffields   : array[1..Nfields] of Tcard;
  buttoncount:integer;
  basefilename:string;
  ActiveCard  : TImage;
  ActiveField:  Integer;
  paybutton : TButton;
  Buildbutton: TButton;
  Hypothekbutto:TButton;
  InteractionButton: array[1..4] of TButton;
  MietLabels : array[0..5] of TLabel;
  TimerOn: Boolean;
  Wuerfelpossible: Boolean;
  IDIMAGELIST: integer;
  Wuerfelrturns: Integer;
  count : integer; // StartformulaR


implementation
{
TO-Do Liste Project

1. Complete Databank with all Fields
2. Programm Ereigniss und Gemeindschaftsfelder // Benötige ich Spiel aus dem Schul Schließfach
3. Animate Dice
4. Update Look of Field Cards   DONE




}
{$R *.lfm}
{ TForm1 }
 //Functionen ##
function stringfeldTyp(Field:integer):string;
var i:integer;
begin
  i:=play.fields[Field].typ;
  case i of
  1:Result:='Straße';
  2:Result:='Steuer';
  3:Result:='Gemeindschaftsfeld';
  4:Result:='Ereignsifeld';
  5:Result:='Verkehrsfeld';
  6:Result:='Kraftwerk';
  7:Result:='Go to Jail';
  8:Result:='Corner';
  end;
end;
function onwedallstreatsofakind(Field:integer):Boolean;
var i,count:integer;
    relatedstreat:integer;
begin
  count:=0;
  for i:=1 to play.fields[Field].NstreatsofK do
  begin
       relatedstreat:=play.fields[Field].relatedstreets[i];
       //ShowMessage(inttostr(relatedstreat));
       if(play.fields[relatedstreat].owner = play.fields[Field].owner) then INC(Count);
  end;
  if (count= play.fields[Field].NstreatsofK) then Result:=True else Result:=False;

end;
function oriantation(Position,Oben,Links:integer):Toriantation;
var i:integer;
begin
     case Position of
     11://Setzen der Figuren nur auf den Streifen zu Besuch
        begin
             i:=Random(8)+1;
             //ShowMessage(inttostr(i));DebugFunction
             case i of
             1..4: begin
                       Result.height:=Ffields[Position].Card.Top+(25*I-1);
                       Result.width:=Ffields[Position].Card.Left+2;
                  end;
             5..8: begin
                       Result.height:=Ffields[Position].Card.Top+95;
                       Result.width:=Ffields[Position].Card.Left+(24*(i-4));

                  end;
             end;
        end;
     1,21,31:
                begin
                     Result.height:=Ffields[Position].Card.Top+Oben;
                     Result.width:=Ffields[Position].Card.Left+Links;
                end;

     2..10:
           begin
                Result.height:=Ffields[Position].Card.Top+Oben;
                Result.width:=Ffields[Position].Card.Left+Links;

           end;
     12..20:
            begin
                 Result.height:=Ffields[Position].Card.Top+Links;
                 Result.width :=Ffields[Position].Card.Left+Ffields[Position].Card.Width-(Oben+25);
            end;
     22..30:
            begin
                 Result.height:=Ffields[Position].Card.Top+Ffields[Position].Card.Height-(Oben+25);//+25 (+Height der Spieler Bilder
                 Result.width:=Ffields[Position].Card.Left+Links;
            end;
     32..40:
            begin
                 Result.height:=Ffields[Position].Card.Top+Links;
                 Result.width:=Ffields[Position].Card.Left+Oben;

            end;

     end;
end;

// Proceduren  ##
// Würfeln
procedure TForm1.Wuerefel( Sender: TObject);
var summe,zahl1,zahl2:integer;
begin
  summe:=0;                  // Gesamt Augensumme
  zahl1:=Random(6)+1;        // Würfel Links
  zahl2:=Random(6)+1;        // Würfel Rechts
  summe:=zahl1+ zahl2;       // Gesamt Augenzahl
  Image2.Picture.LoadFromFile(basefilename+'\Grafiken\Dice\Scaled\'+inttostr(zahl1)+'-'+IntToStr(zahl2)+'.jpg');// Grafisceh Ausgabe des Ergenisses
  if (zahl1=zahl2) then      // Es ist ein Pasch gewürfelt
  begin
       Inc(Wuerfelrturns);   // Erhöhen der Würfelrunden(Paschanzahl)
  end;
  if( Wuerfelrturns = 3)then // Abfrage ob 3 Päsche Gefallen sind
  begin                      // Wenn ja, dann kommt Spieler ins Gefängiss
  play.player[buttoncount].jailturns:=3;  // Abzusitzende runde sind 3
  ShowMessage('Du hast 3 mal einen Pasch gewürfelt und musst in das gefängnis');
  Wuerfelrturns:=0;          // Zurücksetzen der Anzahl für nächsten Spieler
  inc(buttoncount);          // Erhöhne der Spieler Refernz um Ernieriegen am Ende Aufgrund des Pasches entgegen zuwirken
  end
  else                       // Wenn nein
  begin
       if( play.player[buttoncount].jailturns=0) then   // Normale Schleife wenn Spieler nicht im Gefängniss
       begin
            move(self,buttoncount,summe);     // Bewegen des Spielers
            GrafikUserOutPut(self, play.player[buttoncount].position);// Grafische Benutzer Ausgabe
            StreatInteraction(self,play.player[buttoncount].position);// Interaktion
       end
       else
       begin    // Schleife falls er im Gefängnis ist
            if( zahl1=zahl2) then  // Raus kommen beim Pasch
            begin
                 move(self,buttoncount,summe);     // Bewegen des Spielers
                 GrafikUserOutPut(self, play.player[buttoncount].position);// Grafische Benutzer Ausgabe
                 StreatInteraction(self,play.player[buttoncount].position);// Interaktion
                 play.player[buttoncount].jailturns:=0;
            end
            else
            begin                 // Mitteilung bei Misserfolg
                 ShowMessage('Du hast keinen Pasch gewürfelt und Bleibst weiterhin im Gefängnis');
                 play.player[buttoncount].jailturns:=play.player[buttoncount].jailturns-1;
            end;
       end;
  end;
  if( zahl1=zahl2) then                                          // Im Fall eines Pasches
      dec(buttoncount)                                           // Erniedrigen der Spielerreferenz, entgegen des Erhöhnes bei Image2.Click
      else Wuerfelrturns:=0;;                                    // Wenn nicht  reset der Würfelrunden

end;
// Geldtransaktions Procedur
procedure pay(IDpayer,cash,IDreceiver:Integer);
begin
  if(IDpayer<>0) then
      begin
           if( cash < play.player[IDpayer].money)
               then
               begin
                    play.player[IDpayer].money:=play.player[IDpayer].money-cash;
                    if (0>IDreceiver) then play.player[IDreceiver].money:=play.player[IDreceiver].money+cash;
               end
               else;
               // deupgrade, hypotec a property,trade a property and sell a property
      end
      else     play.player[IDreceiver].money:=play.player[IDreceiver].money+cash;

end;


//Update Player, Positioniert Spieler Bild grafisch auf dem Feld, wo sich der Spieler befindet
procedure UpdatePlayer(ID:integer);
var Top,Left:integer;
    orantation: Toriantation;
begin
     case ID of
     1..4:Top:=60;
     5..8:Top:=85;
     end;
     case ID of
     1,5  :Left:=-3;
     2..4 :Left:=19*(ID-1);
     6..8 :Left:=19*(ID-5);
     end;
     orantation:= oriantation(play.player[ID].position,Top,Left);
     play.player[ID].image.Top:=orantation.height;
     play.player[ID].image.Left:=orantation.width;

end;
// Kontrolliert ob Spieler im Spiel aktiv ist
procedure PlayerinGame();
var i:integer;
begin
  for i:=1 to 8 do
  begin
       if(i<= Nplayer) then   play.player[i].image.Visible:=True
                       else   play.player[i].image.Visible:=False;
       UpdatePlayer(i);
  end;

end;
// Bewegen des Spielers
procedure TForm1.move(Sender: Tobject; ID,distance: integer);
begin
     play.player[ID].position:=play.player[ID].position + distance;
     if (play.player[ID].position >40) then play.player[ID].position:=play.player[ID].position -40;
     UpdatePlayer(ID);
end;

// GrafikUserOutPut, Zeigt die Informationen der Rückzeite einer Spielkarte znetriert an
procedure TForm1.GrafikUserOutPut(Sender: TObject; FIELDID:integer);
var i:integer;

begin
  //Alte unschöen Variante der Listbox
  //Form1.ListBox1.Clear;
  //Ausgabe Spieler Information nur im Debug Fenster Möglich
  with Form1.ListBox1.Items do
       begin
            Add('Name: '+play.fields[FIELDID].name);
            Add('Typ : '+stringfeldTyp(FIELDID));
            if (play.fields[FIELDID].typ=1) then
                begin
                     if(play.fields[FIELDID].owner=0)
                     then
                         Add('Die Straße gehört noch keinem und kann für '+inttostr(play.fields[FIELDID].price) +' gekauft werden')
                     else
                         begin
                         Add('Die Straße gehört Spieler '+inttostr(play.fields[FIELDID].owner));
                            if (play.fields[FIELDID].hypothek= False)
                            then Add('Die Miete der Straße beträgt'+inttostr(play.fields[FIELDID].rent[play.fields[FIELDID].Nhouses]))
                            else Add('Die Straße ist eine Hypothek und ist kostenfrei');
                         end;
                     Add('Die Grundmiete beträgt '+inttostr(play.fields[FIELDID].rent[0])+'€');
                     Add('Mit 1 Haus       beträgt die Miete      '+ inttostr(play.fields[FIELDID].rent[1])+' €');
                     for i:=2 to 4 do Add('Mit '+inttostr(i)+' Häusern beträgt die Miete      '+inttostr(play.fields[FIELDID].rent[i])+' €');
                     Add('Mit einem Hotel '+inttostr(play.fields[FIELDID].rent[5])+' €');
                     Add('Der Ausbau pro Haus oder Hotel kostet'+ inttostr(play.fields[FIELDID].pricetobuid)+' €');
                     Add('Der Hypothekenwert des Grundstückes beträgt ' + floattostr((play.fields[FIELDID].price)/2)+' €')
                end;
       end;
  //Graphic Style
  //Abfrage ob schon Programierter Typ          If Abfragen Könnten auch über case Abfragen intellikenter gelöst werden
  case play.fields[FIELDID].typ of
       0,1,2,3,4,5,6,8,7,9:
      begin
           //Positionierung und Ausrichtung des Straßenpanels , Sichbarkeit Von Ausgabe Labels und Groupbox unsichbarkeit Bild datie
           GroupBox9.Visible:=false;
           strassenpannel.Visible:=True;
           strassenpannel.Left:=344;
           strassenpannel.Height:=344;
           strassenpannel.Top:=336;
           strassenpannel.Width:=248;
           GroupBox5.Visible:=true;
           Label19.Visible:=True; // FindComponent with List Function funktioniert nicht, hat keinen Sinn, Labels Generus im Arrray zu erstellen
           Label25.Visible:=True;
           Label26.Visible:=True;
           Image3.Visible:=False;
           Panel3.Color:=play.fields[FIELDID].color;
           Panel3.Caption:=play.fields[FIELDID].name;
           //Abfrage und Anzeigen des Besitzers
           if(play.fields[FIELDID].owner<>0) then
           begin
                Label25.Visible:=True;
                Label26.Visible:=True;
                Label26.Caption:=play.player[play.fields[FIELDID].owner].name;
           end
           else
           begin
                Label25.Visible:=False;
                Label26.Visible:=False;;
           end;
           for i:=0 to 5 do MietLabels[i].Visible:=True;
           //Abfrage Typ des Feldes als Straße
           if ( play.fields[FIELDID].typ=1) then
           begin

                // Ausgabe Grundstückswert
                Label42.Caption:=inttostr(play.fields[FIELDID].price);
                // Erstellen und Ausfüllen der Mietspreise

                for i:=0 to 5 do MietLabels[i].Caption:=Inttostr(play.fields[FIELDID].rent[i]);
                // Ausfüllen Ausbau kosten
                Label48.Caption:=Inttostr(play.fields[FIELDID].pricetobuid);
                Label49.Caption:=Inttostr(play.fields[FIELDID].pricetobuid);
                Label50.Caption:=Inttostr(play.fields[FIELDID].price div 2);
           end;
          // Ereignisfeld GemeinschaftsFeld und Steuer so wie Freiparken
          case play.fields[FIELDID].typ of
               0,2,3,4,8,5,6,7 :
                       begin
                            Panel3.Caption:=play.fields[FIELDID].name;
                            Label19.Visible:=False; // FindComponent with List Function funktioniert nicht, hat keinen Sinn, Labels Generus im Arrray zu erstellen
                            Label25.Visible:=False;
                            Label26.Visible:=False;
                            for i:=0 to 5 do MietLabels[i].Visible:=False;
                            GroupBox5.Visible:=False;
                            Image3.Visible:=True;
                            Image3.Picture.LoadFromFile(basefilename+'\Grafiken\BILDER\card'+inttostr(FIELDID)+'.jpg');
                       end;
          end;

      end;

  end;

end;

// CardClick , Prozedure falls die Karte von einem Spieler angeklickt wird, Ruft
procedure TForm1.CardClick(Sender: TObject);
var ID:integer;
begin
  ActiveCard:= Sender as TImage;
  ID:=StrToInt(ActiveCard.Name[5..6]);
  //ShowMessage(inttostr(ID));
  ListBox1.Clear;
  GrafikUserOutPut(Self,ID);
  StreatInteraction(Self,ID);
end;
// Zeigt Anzahl der Hotels und Häuser einer Straße oben auf dem Farbstreifen an
procedure GUIUpdate;
var i,o,y:Integer;
begin
  //Update Visibiliti of Hotels and Houses

  for i:=1 to Nfields do
  begin
       if( play.fields[i].typ=1)
       then
           begin
                for y:=1 to 4 do Ffields[i].Houses[y].Visible:=False;
                Ffields[i].Hotel.Visible:=False;
                if(play.fields[i].Nhouses>0) and (play.fields[i].Nhouses<5)then
                    begin
                         for o:=1 to play.fields[i].Nhouses do
                         begin
                              Ffields[i].Houses[o].Visible:=True;
                         end;
                    end;
                if(play.fields[i].Nhouses=5) then Ffields[i].Hotel.Visible:=True;
           end;
  end;
end;

// Steuert Würfel Animation
procedure TForm1.Timer1Timer(Sender: TObject);

begin
     ImageList1.GetBitmap(IDIMAGELIST,Image2.Picture.Bitmap);
     Inc(IDIMAGELIST);
     If( IDIMAGELIST= 11) then
     begin
              IDIMAGELIST:=0;
              Timer1.Enabled:=False;
              TimerOn:=False;
              // Lade Image Ergebniss
              Wuerefel(self);
     end;
end;
 // Spezifische Interaktion Proceduren
procedure TForm1.casjtransferbuy(Sender: TObject);
begin;
     pay(buttoncount,play.fields[ActiveField].price,0);       // Bezahlen des Grundstückpreises
     play.fields[ActiveField].owner:=buttoncount;             // Er nennen als Eigentümer
     INC(play.player[buttoncount].Nownedstreets);             // Stolzer Besitzer von einem Feld mehr
     play.player[buttoncount].streets[play.player[buttoncount].Nownedstreets]:=ActiveField; // Zuweisen der neuen Erworbenen Feld Position
     InteractionButton[1].Visible:=False;                     // Verschwinden des Kauf Buttons


end;
procedure TForm1.casjtransfermiete(Sender: TObject);
begin
     pay(buttoncount,play.fields[ActiveField].rent[play.fields[ActiveField].Nhouses],play.fields[ActiveField].owner); // Bezahlen der Miete
     InteractionButton[1].Visible:=False;                                                                             // Verschwinden des Miet Buttons
     Image2.Visible:=True;                                                                                            // wieder sichtbarkeit des Würfel feldes
     Wuerfelpossible:=True;                                                                                           // Freigabe des Würfels

end;
procedure TForm1.casjtransferbuildhous(Sender: TObject);
begin

     pay(buttoncount,play.fields[ActiveField].pricetobuid,0);                                                         // Bezahlen des Ausbaues
     if( play.fields[ActiveField].Nhouses<=4) then Inc(play.fields[ActiveField].Nhouses) ;                            // Erhöung der Häuser Anzahl bis zum Hotel
     ListBox2.Items.Add('Die Straße besitz jetzt '+inttostr(play.fields[ActiveField].Nhouses)+ 'Häuser' );            // Listbox Inforamtions Ausgabe
     GUIUpdate();                                                                                                     // Update der Grafischen Oberfläche
     if( play.fields[ActiveField].Nhouses=5) then InteractionButton[2].Visible:=False;                                // Wenn komplett Ausgebaut verschwinden des Ausbau Buttons
     StreatInteraction(Self,ActiveField);                                                                             // Ruft Streatinteraction auf damit z.B noch mehr Häuser gebaut werden können

end;
procedure TForm1.casjtransferdestroyhous(Sender: TObject);
begin
     pay(0,(play.fields[ActiveField].pricetobuid div 2),buttoncount);                                                 // Rückzahlung Halben AUsbau Preis
     if( play.fields[ActiveField].Nhouses>0) then Dec(play.fields[ActiveField].Nhouses) ;                             // Wenn Möglich erniedrigen der Häuser zahl
     ListBox2.Items.Add('Die Straße besitz jetzt '+inttostr(play.fields[ActiveField].Nhouses)+ 'Häuser' );            // Listbox Inforamtions Ausgabe
     GUIUpdate();                                                                                                     // Update der Grafischen Oberfläche
     if( play.fields[ActiveField].Nhouses=0) then InteractionButton[3].Visible:=False;                                // Wenn komplet abgebaut verschwinden des abriss Buttons
     StreatInteraction(self,ActiveField);                                                                             // Ruft Streatinteraction auf damit z.B noch mehr Häuser abgerissen werden können
end;
procedure TForm1.casjtransfersellhous(Sender: TObject);
begin
  repeat                                                                                                              // Schleife zum Abreißen Möglihcher Häuser
     pay(0,(play.fields[ActiveField].pricetobuid div 2),buttoncount);
     if( play.fields[ActiveField].Nhouses>0) then Dec(play.fields[ActiveField].Nhouses)
  until play.fields[ActiveField].Nhouses=0;
  pay(0,play.fields[ActiveField].price,buttoncount);                                                                  // Bezahlen des Grundstück preises
  play.fields[ActiveField].owner:=0;                                                                                  // Ändern der Bezitstandes
  InteractionButton[1].Visible:=False;                                                                                // Entfernt Verkauf Knopf
end;
procedure TForm1.casjtransferhypotec(Sender: TObject);
var cash:integer;
begin
     cash:=play.fields[ActiveField].price div 2 ;                                                                      // Errechnen des zu Erhalten Geldes
     pay(0,cash,buttoncount);                                                                                          // Auszahlung des Geldbetrages
     with play.fields[ActiveField] do                                                                                  // Status änderung
     begin
          hypothek:=True;
     end;
     GUIUpdate();                                                                                                      // Update Grafische Oberfläche
     InteractionButton[4].Visible:=False;                                                                              // Verschwinden des Hypothelen Buttons

end;

// Procedure, Verwaltet Events von Ereigniss und Gemeindschaftskarten
procedure TForm1.Interactionspecialcards(Sender :TObject);
begin

end;


procedure TForm1.StreatInteraction(Sender: TObject;FieldID:integer);
var i:Integer;
    OriantationButton: Toriantation;
begin
  // Grundprinzp Typ Abfrage, Relation zum Spieler und generierung Grafischer Benutzer Buttons
if (buttoncount<>0) then
    begin
     // Übermitteln des Geraden Aktivenfeldes als globale verwendete Variable
     ActiveField:=FieldID;
     // Funktion um Bezugspung der Buttons zum Aktivem Spielfled zu bekommen
     OriantationButton:= oriantation(FieldID,80,-10);
     // Unsichbar machen aller Buttons
     for i:=1 to 4 do InteractionButton[i].Visible:=False;
     // Speziefizieren der Knöpfe 1 und 2
     with InteractionButton[1] do
         begin
              Height:=16;
              Width:=50;
              Left:=OriantationButton.width;
              Top:=OriantationButton.height;
         end;
     with InteractionButton[2] do
     Begin
          Top:=OriantationButton.height;
          Left:=OriantationButton.width +50;
          Height:=16;
          Width:=50;
     end;


    // Abfrage ob Anfragender Spieler sich auf dem Aktivem Feld befindet


    if (FieldID= play.player[buttoncount].position) then
    begin
         // Abfrage ob Aktives Feld vom Typ Straße,Verkehrsfeld oder Kraftwerk ist
         if (play.fields[play.player[buttoncount].position].typ= 1)or(play.fields[play.player[buttoncount].position].typ= 5)or (play.fields[play.player[buttoncount].position].typ= 6)
         then
         With InteractionButton[1] do
         begin
                  //Abfrage ob Straße kaufbar ist
                  If(play.fields[FieldID].owner=0)and(play.fields[FieldID].owner<>buttoncount) then
                      begin
                           Visible:=True;
                           Caption:='BUY';
                           OnClick:=@casjtransferbuy;
                 end;
                 // Abfrage ob Miete anfällt
                 If(play.fields[ActiveField].owner<>0)
                     and (play.fields[ActiveField].owner<>buttoncount)
                     and (play.fields[ActiveField].hypothek= false) then
                 begin
                      Wuerfelpossible:=False;
                      Visible:=True;
                      Caption:='RENT';
                      OnClick:=@casjtransfermiete;
                 end;
         end;
         // Abfrage ob Feld Steuer ist
         If( play.fields[ActiveField].typ= 2)then
         with InteractionButton[1] do
         begin
              Wuerfelpossible:=False;
              Visible:=True;
              Caption:='PAY';
              OnClick:=@casjtransfermiete;
         end;
         // Abfrgae ob Actives Feld Ereigniss oder Gemeinschaftsfeld ist
         {if( play.fields[ActiveField].typ=3) or (play.fields[ActiveField].typ=4) then
         With InteractionButton[1] do
         begin
              Width:=100;
              Button5.Visible:=False;
              Visible:=True;
              Caption:='Karte ziehen';
              OnClick:=@Interactionspecialcards;
         end;  }
    // Abfrage ob Typ Gehe ins Gefängnis
       if( play.fields[ActiveField].typ=7 ) then
       begin
            play.player[buttoncount].position:=11;
            ShowMessage('DU Musst in das Gefängnis gehen');
            UpdatePlayer(buttoncount);
            play.player[buttoncount].jailturns:=3;
       end;
    end;
    //Abfrage ob Aktives Feld dem Anfragendem Spieler gehört
    if( play.fields[FieldID].owner=buttoncount)  then
        begin
             GUIUpdate;
             // Spezifizieren Interaction Button 1(Verkauf) und Button 2( Ausbau)
             with InteractionButton[1] do
             begin
                  Visible:=True;
                  Caption:='Sell';
                  OnClick:=@casjtransfersellhous;
             end;
             with InteractionButton[2] do
             begin
                  Top:=OriantationButton.height;
                  Left:=OriantationButton.width +50;
                  Height:=16;
                  Width:=50;
                  //Abfarge ob Straße ausgebaut werden kann
                  if(onwedallstreatsofakind(FieldID)=True) and (play.fields[FieldID].Nhouses<>5)
                  then
                      begin
                           Visible:=True;
                           Caption:='BUILD';
                           OnClick:=@casjtransferbuildhous;
                      end;
             end;
             //Abfrage ob Häuser abgerissen werden können
             if (play.fields[FieldID].Nhouses>0) then
                 begin
                      with InteractionButton[3] do
                      begin
                           Visible:=True;
                           Top:=OriantationButton.height+16;
                           Left:=OriantationButton.width+50;
                           Height:=22;
                           Width:=50;
                           Caption:='Destroy';
                           OnClick:=@casjtransferdestroyhous;
                      end;
                 end;
             // Erstellen einer Hypotec
             with InteractionButton[4] do
             begin
                  Top:=OriantationButton.height+16;
                  Left:=OriantationButton.width;
                  Height:=22;
                  Width:=50;
                  if(play.fields[FieldID].hypothek= False)
                  then
                      begin
                           Visible:=True;
                           Caption:='Hypotec';
                           OnClick:=@casjtransferhypotec
                      end;
             end;

        end;
   end;

end;
// Läde und Erstellt das Komplette Spielfeld
procedure TForm1.FieldCreate(Sender:TObject) ;
// Has an Array of Images and creates The TImages while Run-Time in an Array, Location are Respective to the Orientation Zero of The Parent Groupbox
// More Efficen and more over handable as a general procedure in the Programm
var i,h:Integer;//h count Houses of a Streat
    PSPT,PSPL,b:integer;
begin
         // Creating the Indiviudal Cards as TImage as Map at Run time
         for i:= 1 to Nfields do
         begin
             Ffields[i].Card:= TImage.Create(Self);
             with Ffields[i].Card do
             begin
                 Name:='card'+inttostr(i);
                 Visible:=True;
                 Parent:= Form1.GroupBox3;
                 Picture.LoadFromFile(basefilename+'\Grafiken\Bilder\card'+inttostr(i)+'.jpg');
                 OnClick:= @CardClick;          // Verweist Generelle Object.Click Event

             end;
             //Setzen des Hotels
                  //Abmaße der Ecke
                  if (i=11)or(i=1)or(i=21)or(i=31) then
                  Begin;
                  with Ffields[i].Card do
                        begin
                           Height:=124;
                           Width:=124;
                           case i of
                           1: Top:=798;
                           11:Top:=798;
                           21:Top:=-10;
                           31:Top:=-10;
                           end;
                           case i of
                           1: Left:=808;
                           11:Left:=0;
                           21:Left:=0;
                           31:Left:=808;
                           end;
                         end;
                  end;
         end;

         for i:=2 to 10 do
         begin
             with Ffields[i].Card do
             Begin
                 Width:=76;
                 Height:=124;
                 Top:=808-10;
                 Left:=884-76*i;
             end;
         end;

         //Senkrechte Reihe Links
         for i:=12 to 20 do
         begin
             with Ffields[i].Card do
             Begin
                 Width:=124;
                 Height:=76;
                 Top:=808-10-76*(i-11);
                 Left:=0;
             end;
         end;
         //Waagerechte Reihe Oben
         for i:=22 to 30 do
         begin
              with Ffields[i].Card do
              Begin
                  Height:=124;
                  Width:=76;
                  Top:=-10;
                  Left:=124+76*(i-22);
              end;

         end;
         //Senkrechte Reihe Rechts
         for i:=32 to 40 do
         begin
             with Ffields[i].Card do
             Begin
                 Width:=124;
                 Height:=76;
                 Top:=124-10+76*(i-32);
                 Left:=808;
             end;
             if( play.fields[i].typ=1) then


         end;
        //Hotels
         for i:=1 to Nfields do
         begin
               if( play.fields[i].typ=1) then
               begin
                  // HOTELS
                  Ffields[i].Hotel:= TImage.Create(Ffields[i].Hotel);
                  with Ffields[i].Hotel do
                  begin
                       Visible:=False;
                       Parent:= Form1.GroupBox3;
                       Height:=30;
                       Width:=30;
                       Picture.LoadFromFile(basefilename+'\Grafiken\Bilder\hotel.png');
                  end;

               case i of
               // Unten
               2..10:
                     begin
                          with Ffields[i].Hotel do
                          begin
                               Left:=Ffields[i].Card.Left+23;
                               Top:=Ffields[i].Card.Top-3;
                          end;
                     end;

               //Links
               12..20:
                    begin
                    with Ffields[i].Hotel do
                         begin
                              Left:=Ffields[i].Card.Left+Ffields[i].Card.Width-23;
                              Top:=Ffields[i].Card.Top+23;
                         end;
                    end;
               //oben
               22..30:
                    begin
                    with Ffields[i].Hotel do
                         begin
                              Left:=Ffields[i].Card.Left+23;
                              Top:=Ffields[i].Card.Top+97;
                         end;
                    end;

               //Rechts
               32..40:
                      begin
                      with Ffields[i].Hotel do
                           begin
                                Left:=Ffields[i].Card.Left-1;
                                Top:=Ffields[i].Card.Top+23;
                           end;
                      end;
               end;
               end;


         end;
         // Häuser
         for i:=1 to Nfields do
         begin
         if( play.fields[i].typ=1) then
             begin
                  for h:=1 to 4 do
                  begin
                       Ffields[i].Houses[h]:=TImage.Create(Ffields[i].Houses[h]);
                       with Ffields[i].Houses[h] do
                            begin
                                 Visible:=False;
                                 Parent:= Form1.GroupBox3;
                                 Picture.LoadFromFile(basefilename+'\Grafiken\Bilder\house.png');
                                 Height:=20;
                                 Width:=20;
                                 //Left:=Ffields[i].Card.Left+(18*h)-18;
                                 //Top:=Ffields[i].Card.Top+100;
                                 case i of
                                 //Unten
                                 2..10:
                                       begin
                                            Left:=Ffields[i].Card.Left+(18*h)-18;
                                            Top:=Ffields[i].Card.Top+2;

                                       end;
                                 12..20:
                                       begin
                                            Left:=Ffields[i].Card.Left+103;
                                            Top:=Ffields[i].Card.Top+(18*h)-18;
                                       end;
                                 22..30:
                                       begin
                                            Left:=Ffields[i].Card.Left+(18*h)-18;
                                            Top:=Ffields[i].Card.Top+100;
                                       end;
                                 32..40:
                                      begin
                                           Left:=Ffields[i].Card.Left+3;
                                           Top:=Ffields[i].Card.Top+(18*h)-18
                                      end;
                                 end;

                            end;
                  end;
             end;
         end;
         //Spieler Rein Laden
         PSPT:=828;     // Pixel für Losfeld von Oben gerechnet
         PSPL:=800;     // Picel für Losfeld von Links gerechnet
         for i:=1 to Nplayer do
         begin
              b:=i;
              play.player[i].image:= TImage.Create(nil);
              with play.player[i].image do
                   begin
                        Visible:=True;
                        Parent:=Form1.GroupBox3;
                        Height:=25;
                        Width:=25;
                        Picture.LoadFromFile(basefilename+'\Grafiken\BilderSpieler\player'+inttostr(i)+'.png');
                        case i of
                        1..4:
                        begin
                             Top:=PSPT;
                             Left:=PSPL+25*b;
                        end;
                        5..8:
                        begin
                             Top:=PSPT+Height;
                             Left:=PSPL+25*(b-4);
                        end;
                        end;
                   end;
         end;
         //Creates Interaction Buttons
         for i:=1 to 4 do
         begin
              InteractionButton[i]:=TButton.Create(self);
              InteractionButton[i].parent:= GroupBox3;
              InteractionButton[i].Visible:=False;
              InteractionButton[i].Top:=0;
              InteractionButton[i].Left:=0;
         end;
         // Erstellen Miet Labels

         for i:= 0 to 5  do
         begin
              MietLabels[i]:= TLabel.Create(self);
              with MietLabels[i] do
               begin
                   Parent:= strassenpannel;
                   Left:=191;
                   Height:=15;
                   Top:=108+i*16;
                   Caption:='  ';
               end;
         end;
end;
procedure TForm1.FormCreate(Sender: TObject);
var filename:string;
    i:integer;
    check: Boolean;

begin
  count:= 1;
  Wuerfelpossible:=True;
  Wuerfelrturns:=0;
  Timer1.Enabled:=False;
  Nplayer:=8;
  play.player[2].name:='Ani';
  Randomize;
  basefilename:=ExtractFileDir(ParamStr(0));
  check:= FileExists(basefilename+'\Spielstandt\CleanGame');
  if (check=True)
  then
      filename:=basefilename+'\Spielstandt\CleanGame'
  else
      begin
           ShowMessage('Öffne bitte die Datei, "Basespeicherort"');
           if Form1.OpenDialog1.Execute then basefilename:=OpenDialog1.FileName;
           i:=Length(basefilename);
           i:=i-16;
           basefilename:=basefilename[1..i];
           filename:=basefilename+'\Spielstandt\CleanGame';
      end;
  AssignFile(game,filename);
  Reset(game);
  while not Eof(game)do
  begin
       read(game,play);
  end;
  CloseFile(game);
  FieldCreate(self);
  buttoncount:=0;
  //GroupBox6.Visible:=True;
end;

// Click Object Proceduren Form 1
procedure TForm1.GroupBox1Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox2Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox3Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox5Click(Sender: TObject);
begin

end;

procedure TForm1.GroupBox6Click(Sender: TObject);
begin

end;

procedure TForm1.Image2Click(Sender: TObject);
var clickcount: integer;
begin
  INC(clickcount);

  if(play.player[buttoncount+1].jailturns>0) then
  begin
       GroupBox9.Visible:=True;
       strassenpannel.Visible:=False;
       if( buttoncount>=Nplayer) then buttoncount:=0;
       Inc(buttoncount,1);
       Label59.Caption:='AKTIVER SPIELER: '+play.player[buttoncount].name;
       clickcount:=0;
  end
  else
  begin
         if( Wuerfelpossible= True) then
         begin
             if( buttoncount>=Nplayer) then buttoncount:=0;
             Inc(buttoncount,1);
             Label59.Caption:='AKTIVER SPIELER: '+play.player[buttoncount].name;
             Timer1.Enabled:=True; // Ruft die Funktion des Timersauf ,dieser Starte Animation und zeigt Würfel ereigniss
             clickcount:=0;
         end
         else
         begin
              if( clickcount>2) then ShowMessage(' Es musst erst die Miete oder Steuerbezahlen, bevor wieder gewürfelt werden kann');
         end;

  end;

  // Debug Lines
  //ListBox1.Clear;
  //roll_normal(buttoncount);
  //Form1.ListBox1.Items.Add('Hallo Spieler '+inttostr(buttoncount)+', Du bist auf Folgendem Feld '+play.fields[play.player[buttoncount].position].name+' gelandet' );
  //Form1.ListBox1.Items.Add('Du besitzt '+ inttostr(play.player[buttoncount].money)+'€');
  //GrafikUserOutPut(self, play.player[buttoncount].position);
  //StreatInteraction(self,play.player[buttoncount].position);

end;

procedure TForm1.Label25Click(Sender: TObject);
begin

end;

procedure TForm1.Label46Click(Sender: TObject);
begin

end;

procedure TForm1.Label60Click(Sender: TObject);
begin
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
  GroupBox4.Visible:=True;
end;

procedure TForm1.MenuItem11Click(Sender: TObject);
begin
  GroupBox4.Visible:=False;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Inc(buttoncount,1);
  move(self,buttoncount,7);
  if (buttoncount=8) then buttoncount:=0;
  //Debug Button

end;
procedure TForm1.Button5Click(Sender: TObject);

begin
  if( buttoncount=8) then buttoncount:=0;
  Inc(buttoncount,1);
  ListBox1.Clear;
  //roll_normal(buttoncount);
  Form1.ListBox1.Items.Add('Hallo Spieler '+inttostr(buttoncount)+', Du bist auf Folgendem Feld '+play.fields[play.player[buttoncount].position].name+' gelandet' );
  Form1.ListBox1.Items.Add('Du besitzt '+ inttostr(play.player[buttoncount].money)+'€');
  GrafikUserOutPut(self, play.player[buttoncount].position);
  StreatInteraction(self,play.player[buttoncount].position);
end;
procedure TForm1.Button8Click(Sender: TObject);
begin
  // Debug Button
  if( buttoncount=8) then buttoncount:=0;
  Wuerefel(self);
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
var msg: String;
begin
     // Quelle   http://www.askingbox.com/info/delphi-show-do-you-really-want-to-close-dialog-before-closing-the-form
     msg:='Du bist dabei das Spiel zu beenden, Durch Drücken von "Cancel" kannst du unter Start,deinen Spielstandt speichern'  ;
     if MessageDlg(msg, mtConfirmation, [mbOk, mbCancel], 0) = mrCancel then
     CanClose := false;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
    if Form1.OpenDialog1.Execute then AssignFile(game,OpenDialog1.FileName);
    Reset(game);
    while not Eof(game)do
    begin
         read(game,play);
         end;
    CloseFile(game);
    try
       FieldCreate(self);
    finally
    end;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
    if Form1.SaveDialog1.Execute then AssignFile(game,SaveDialog1.FileName);
    Rewrite(game);
    write(game,play);
    CloseFile(game);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
var ID,SID,RID:integer;
begin
  Edit2.Caption:='';
  Edit3.Caption:='';
  Edit4.Caption:='';
  Edit5.Caption:='';
  Edit6.Caption:='';
  Edit8.Caption:='';
  Edit9.Caption:='';
  Edit10.Caption:='';
  Edit11.Caption:='';
  Edit12.Caption:='';
  Edit14.Caption:='';
  Edit16.Caption:='';
  ID:=strtoint(Edit1.Text);
  Edit2.Text:=play.fields[ID].name;
  Edit3.Text:=inttostr(play.fields[ID].typ);
  if (play.fields[ID].hypothek=False)
     then Edit4.Caption:='nein'
     else Edit4.Caption:='ja';
  Edit5.Text:=inttostr(play.fields[ID].price);
  Edit6.Text:=inttostr(play.fields[ID].NstreatsofK);
  try
     SID:=strtoint(Edit7.Text);
     Edit8.Text:=inttostr(play.fields[ID].relatedstreets[SID]);
  except
     ShowMessage('Es wurde keine Anzahl von gleichen Straßen angegeben');
  end;
  Edit9.Text:=inttostr(play.fields[ID].owner);
  Edit10.Text:=inttostr(play.fields[ID].pricetobuid);
  Edit11.Color:=play.fields[ID].color;
  Edit12.Text:=inttostr(play.fields[ID].Nhouses);
  try
     RID:=strtoint(Edit13.Text);
     Edit14.Text:=inttostr(play.fields[ID].rent[RID]);
  except
     ShowMessage('Es wurde keine Position für die spezifuische zugehöriger Hauspreis gegeben');
  end;


end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  PlayerinGame();
end;

procedure TForm1.Button12Click(Sender: TObject);
var PID:integer;
begin
  PID:=strtoint(Edit15.Text);
  play.player[PID].position:=StrToInt(Edit16.Text);
  play.player[PID].money:=StrToInt(Edit17.Text);
  play.player[PID].jailturns:=StrToInt(Edit18.Text);
  play.player[PID].name:=Edit19.Text;
  UpdatePlayer(PID);
  ListBox2.Clear;
  GrafikUserOutPut(self, play.player[PID].position);
  buttoncount:=PID;
  StreatInteraction(Self,play.player[PID].position);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
      play.player[buttoncount].money:=play.player[buttoncount].money-50;
      play.player[buttoncount].jailturns:=0;
      Timer1.Enabled:=True; // Ruft die Funktion des Timersauf ,dieser Starte Animation und zeigt Würfel ereigniss
      Groupbox9.Visible:=False;
      strassenpannel.Visible:=True;
end;


procedure TForm1.Button14Click(Sender: TObject);
var i:integer;
begin
  Nplayer:=strtoint(Edit20.Text);
  if (Nplayer<=1) or( Nplayer>8) then
  begin
       label40.Caption:='Bitte gib eine Spieleranzahl zwischen 2 und 8 ein!';
       GroupBox8.Visible:=False;
  end

  else
  begin
       for i:=1 to Nplayer do play.player[i].money:=strtoint(edit21.text);
       groupbox8.visible:=true;
  end;
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  if( count<=Nplayer)then
  begin
  play.player[count].name:=Edit22.Text;
  edit22.text:=' ';
  Inc(count);
  Label46.Caption:='Spieler ' + inttostr(count);


  end;
  if (count=Nplayer+1) then
  begin
       Button15.Visible:=False;
       count:=1;
       GroupBox6.Visible:=False;
       PlayerinGame();
       Groupbox3.Visible:=True;
  end;
end;

procedure TForm1.Button18Click(Sender: TObject);
begin

end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Timer1.Enabled:=True;
  GroupBox9.Visible:=False;
  strassenpannel.Visible:=True;
end;

procedure TForm1.Button11Click(Sender: TObject);
var PID:integer;
begin
  PID:=strtoint(Edit15.Text);
  Edit16.Text:=inttostr(play.player[PID].position);
  Edit17.Text:=inttostr(play.player[PID].money);
  Edit18.Text:=inttostr(play.player[PID].jailturns);
  Edit18.Text:=play.player[PID].name;
  UpdatePlayer(PID);


end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  end;

procedure TForm1.Button2Click(Sender: TObject);
var ID,SID,RID:integer;
    htext:string;
begin
     ID:=strtoint(Edit1.Text);
     play.fields[ID].position:=ID;
     play.fields[ID].name:= Edit2.Text;
     play.fields[ID].typ:=strtoint(Edit3.Text);
     htext:=Edit4.Caption;
     if (htext='ja') then play.fields[ID].hypothek:=True
                    else play.fields[ID].hypothek:=False;
     play.fields[ID].price:=strtoint(Edit5.Text);
     play.fields[ID].NstreatsofK:=strtoint(Edit6.Text);
     try
        SID:=strtoint(Edit7.Text);
        play.fields[ID].relatedstreets[SID]:=strtoint(Edit8.Text);
     Except
     end;
     play.fields[ID].owner:=strtoint(Edit9.Text);
     play.fields[ID].pricetobuid:=strtoint(Edit10.Text);
     play.fields[ID].Nhouses:=strtoint(Edit12.Text);
     try
        RID:=strtoint(Edit13.Text);
        play.fields[ID].rent[RID]:=strtoint(Edit14.Text);
     except
     end;


end;

procedure TForm1.Button3Click(Sender: TObject);
  var farbe:TColor;
      FIELDID: integer;
begin
  if Form1.ColorDialog1.Execute then farbe:=ColorDialog1.Color;
  Edit11.Color:=farbe;
  FIELDID:=strtoint( Edit1.Text);
  play.fields[FIELDID].color:=farbe;


end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Image3.Picture.LoadFromFile('I:\Monopoly S\Grafiken\BILDER\card8.jpg');
end;
procedure TForm1.MenuItem5Click(Sender: TObject);
begin
  GroupBox1.Visible:=True;
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  GroupBox1.Visible:=False;
end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  // Open Clean Game
  GroupBox6.Visible:=True;
end;


procedure TForm1.Panel1Click(Sender: TObject);
begin

end;

procedure TForm1.Panel3Click(Sender: TObject);
begin

end;

end.

