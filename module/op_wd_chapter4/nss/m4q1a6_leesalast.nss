//::///////////////////////////////////////////////
//:: M4Q1A6_LEESALAST
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Leesa's last words
*/
//:://////////////////////////////////////////////
//:: Created By:    Cori May
//:: Created On:    March 15, 2002
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetModule(),"NW_G_M4Q01PLOTLEESA_RESCUE") <2
        && GetObjectSeen(GetNearestObjectByTag("M4Q01A06LUCE"))
        && GetLocalObject(GetModule(),"NW_G_M4Q01PLOTLEESA_SAVIOUR")==GetPCSpeaker())
    {
        return TRUE;
    }
    return FALSE;
}
