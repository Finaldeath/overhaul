//::///////////////////////////////////////////////
//:: Ask Garrett
//:: con_gar_yenna
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has been told to ask Garrett about eavesdropping
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oYenna = GetObjectByTag("q2_yenna");
    iResult = GetLocalInt(oYenna,"OS_YENNA_EAVESDROP")==10
        || GetLocalInt(oYenna,"OS_YENNA_EAVESDROP")==15;
    return iResult;
}
