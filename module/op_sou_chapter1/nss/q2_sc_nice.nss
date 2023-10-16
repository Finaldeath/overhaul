//::///////////////////////////////////////////////
//:: FileName q2_sc_nice: fire this line when pc entered the room with the weapon sheathed.
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/7/2003 11:36:03 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "Q2_PLAYER_WAS_NICE") == 1))
        return FALSE;

    return TRUE;
}
