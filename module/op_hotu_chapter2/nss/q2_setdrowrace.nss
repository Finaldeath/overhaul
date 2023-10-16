// sets Custom Token 500 to the drow word for the PC's race
///Also set First Journal Entry


void main()
{

    AddJournalQuestEntry("q2_Valsharess",5,GetPCSpeaker());

    string sDrowRace;
    int nRace = GetRacialType(GetPCSpeaker());

    if (nRace == RACIAL_TYPE_ELF)
    {
        sDrowRace = GetStringByStrRef(110611);
        //sDrowRace = "darthiir";
    }
    if (nRace == RACIAL_TYPE_DWARF)
    {
        sDrowRace = GetStringByStrRef(110612);
        //sDrowRace = "hargluk";
    }
    if (nRace == RACIAL_TYPE_HALFLING)
    {
        sDrowRace = GetStringByStrRef(110613);
        //sDrowRace = "sakphul";
    }
    if (nRace == RACIAL_TYPE_GNOME)
    {
        sDrowRace = GetStringByStrRef(110614);
        //sDrowRace = "yingil";
    }
    if (nRace == RACIAL_TYPE_HALFELF)
    {
        sDrowRace = GetStringByStrRef(110615);
        //sDrowRace = "tu'rilthiir";
    }
    if (nRace == RACIAL_TYPE_HALFORC)
    {
        sDrowRace = GetStringByStrRef(110616);
        //sDrowRace = "cretok";
    }
    else sDrowRace = GetStringByStrRef(110617);
    //else sDrowRace = "rivvil";

    SetCustomToken(500, sDrowRace);
}
