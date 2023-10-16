//::///////////////////////////////////////////////
//:: FileName q4a_veregon_chk
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 1/9/2003 11:38:03 AM
//:://////////////////////////////////////////////
int StartingConditional()
{

    // Inspect local variables
    if(GetLocalInt(GetPCSpeaker(), "mine_boss") == 1
       && GetLocalInt(OBJECT_SELF, "mine_boss_o") == 0)
        return TRUE;

    return FALSE;
}
