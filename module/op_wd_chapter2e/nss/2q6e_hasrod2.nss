//::///////////////////////////////////////////////
//:: Has Replication Rod
//:: 2q6e_hasrod2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if the PC has the golem replication rod.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    object oPlot = GetItemPossessedBy(GetPCSpeaker(), "2Q6E_GolemRod");
    if(GetIsObjectValid(oPlot))
    {
        return TRUE;
    }
    return FALSE;
}
