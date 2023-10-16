//::///////////////////////////////////////////////
//:: con_mom_undead
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has never spoken to Mommaji about the undead army before
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_MOMMA_UNDEAD")!=10;
    return iResult;
}
