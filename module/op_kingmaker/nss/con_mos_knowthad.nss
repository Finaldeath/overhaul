//::///////////////////////////////////////////////
//:: PC knows Thaddeus Story
//:: con_mos_knowthad
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has heard Thaddeus' story about Gelani
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iResult;
    object oThad = GetObjectByTag("q2_thaddeus");
    iResult = GetLocalInt(GetModule(),"OS_THADDEUS_STORY")==10;
    return iResult;
}
