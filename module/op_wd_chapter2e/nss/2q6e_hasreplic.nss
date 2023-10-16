//::///////////////////////////////////////////////
//:: Has Golem Replication Rod
//:: 2q6e_hasreplic
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC has the replication rod
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    //object oControl = GetItemPossessedBy(GetPCSpeaker(), "2Q6E_GolemRod");
    int nPlot = GetLocalInt(OBJECT_SELF, "NW_2Q6E_CONTROL_ROD");

    if(nPlot == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
