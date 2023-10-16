//::///////////////////////////////////////////////
//:: FileName q2_sc_wpn_drawn: fire this line when a pc has a weapon drawn when entering the room
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/7/2003 11:31:47 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "Q2_WEAPON_DRAWN1") == 1))
        return FALSE;

    return TRUE;
}
