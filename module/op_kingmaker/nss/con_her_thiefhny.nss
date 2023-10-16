//::///////////////////////////////////////////////
//:: Honey Thieves Found
//:: con_her_thiefhny
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The Honey Thieves (kobolds) have been discovered
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = (GetLocalInt(OBJECT_SELF,"OS_HONEY_THIEF")>=10 ||
        GetLocalInt(oPC,"OS_KOBOLD_HONEY")>=10)
        && GetLocalInt(OBJECT_SELF,"OS_HERMIT_KOBOLD")!=10;
    return iResult;
}
