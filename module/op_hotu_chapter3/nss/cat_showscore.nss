//::///////////////////////////////////////////////
//:: Catapults!: Show Score script
//:: Cat_ShowScore.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Compiles the <CUSTOM501> conversation token
     to display the current score.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetFirstPC();
    string sScore = "";

    while (oPC != OBJECT_INVALID)
    {
        string sName = GetName(oPC);
        int iKills = GetLocalInt(oPC, "iKills");
        string sKills = IntToString(iKills);

        sScore = sScore+sName+": "+sKills+". ";
        oPC = GetNextPC();
    }

    SetCustomToken(501, sScore);
}
