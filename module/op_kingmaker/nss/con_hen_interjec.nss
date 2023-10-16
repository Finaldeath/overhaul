//::///////////////////////////////////////////////
//:: con_hen_interjec
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The henchman has an interjection to make
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Nov 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oPC = GetFirstPC();
    iResult = GetLocalInt(oPC,"OS_HENCH_INTERJECT")==10;
    return iResult;
}
