//::///////////////////////////////////////////////
//:: Asked Garrett
//:: con_yen_askedgar
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The player has asked Garrett about eavesdropping
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"OS_YENNA_EAVESDROP")>=20;
    return iResult;
}
