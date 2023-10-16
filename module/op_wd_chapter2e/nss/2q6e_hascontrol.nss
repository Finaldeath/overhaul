//::///////////////////////////////////////////////
//:: Has Golem Control Rod
//:: 2q6e_hascontrol
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the PC has the control rod
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 7, 2002
//:://////////////////////////////////////////////


int StartingConditional()
{
    //object oControl = GetItemPossessedBy(GetPCSpeaker(), "2Q6E_ControlRod");
    int nPlot = GetLocalInt(OBJECT_SELF, "NW_2Q6E_REPLICATION_ROD");
    if(nPlot == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
