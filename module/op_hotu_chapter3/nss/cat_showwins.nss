//::///////////////////////////////////////////////
//:: Catapults!: Show Wins script
//:: Cat_ShowWins.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Compiles the <CUSTOM502> conversation token
     to display the current match wins.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    string sWins = "";

    while (oPC != OBJECT_INVALID)
    {
        string sName = GetName(oPC);
        int iMatchWins = GetLocalInt(oPC, "iMatchWins");
        string sMatchWins = IntToString(iMatchWins);

        sWins = sWins+sName+": "+sMatchWins+". ";
        oPC = GetNextPC();
    }

    SetCustomToken(502, sWins);
}
