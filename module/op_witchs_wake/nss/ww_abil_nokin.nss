//::///////////////////////////////////////////////
//:: Witchwork Conversation System: No Kinship Condition
//:: WW_Abil_NoKin.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the PC and NPC are not of the
    same race.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 28, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sResult = GetLocalString(OBJECT_SELF, "sWW_AbilityResult");
    int iPCRace = GetRacialType(oPC);
    int iNPCRace = GetRacialType(OBJECT_SELF);

    if (sResult == "")
    {
        if (iPCRace != iNPCRace)
        {
            return TRUE;
        }
        return FALSE;
    }
    return FALSE;
}
