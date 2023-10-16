//::///////////////////////////////////////////////
//:: con_hen_surrend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The henchmen has not yet said its surrender script
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_SURRENDER")==10;
    return iResult;
}
