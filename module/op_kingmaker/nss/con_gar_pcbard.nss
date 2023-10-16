//::///////////////////////////////////////////////
//:: PC is bard
//:: con_gar_pcbard
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC is paying for his room with bard songs
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLevelByClass(CLASS_TYPE_BARD, oPC) > 0
        && GetLocalInt(OBJECT_SELF,"OS_SILVER_BARD")==10;
    return iResult;
}
