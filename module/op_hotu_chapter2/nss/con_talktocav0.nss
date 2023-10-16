//::///////////////////////////////////////////////
//:: con_talktocav0
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Checks if the NPC has been talked to 0 times
*/
//:://////////////////////////////////////////////
//:: Created By: Drew Karpyshyn
//:: Created On: July 2, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();

    iResult = GetLocalInt(oPC,"X2_CAVALAS_TALKLEVEL")==0;
    return iResult;
}
