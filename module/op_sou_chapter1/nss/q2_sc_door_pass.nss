//::///////////////////////////////////////////////
//:: FileName q2_sc_door_pass: fire this line when pc got pass the door with his weapon drawn
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/7/2003 11:09:00 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(OBJECT_SELF, "Q2_KOBOLD_DOOR_PASSED") == 1))
        return FALSE;

    return TRUE;
}
