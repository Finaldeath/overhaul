//::///////////////////////////////////////////////
//:: Has Master Portal Stone
//:: 2q6p_LeaveModule
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the Pc has the portal stone.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oStone = GetItemPossessedBy(GetPCSpeaker(), "2Q6K_GrandStone");
    if(GetIsObjectValid(oStone))
    {
        return TRUE;
    }
    return FALSE;
}
