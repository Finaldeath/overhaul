//::///////////////////////////////////////////////
//:: Garrot's story told
//:: con_ali_garrot
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has heard Garrot's story
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oYenna = GetObjectByTag("q2_yenna");
    iResult = GetLocalInt(oYenna,"OS_YENNA_EAVESDROP")>=20;
    return iResult;
}
