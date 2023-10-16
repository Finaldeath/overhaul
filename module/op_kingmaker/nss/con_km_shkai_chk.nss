//::///////////////////////////////////////////////
//:: Soul harvester is devouring the spirit of Kaidala
//:: con_km_shkai_chk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Kaidala is being devoured, make sure the Soul
    Harvester doesn't saythe wrong thing
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    int iDead = GetLocalInt(OBJECT_SELF, "KAIDALA_SACKED");

    // If Kaidala is not dead return true
    iResult = (iDead == FALSE);

    return iResult;
}
