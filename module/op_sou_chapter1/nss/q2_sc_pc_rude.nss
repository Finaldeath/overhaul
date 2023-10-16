//::///////////////////////////////////////////////
//:: FileName q2_sc_pc_rude: fire this line when the door is closed after player has been rude
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 2/7/2003 10:47:33 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "Q2_PC_RUDE_TO_KOBOLD") == 1))
        return FALSE;

    return TRUE;
}
