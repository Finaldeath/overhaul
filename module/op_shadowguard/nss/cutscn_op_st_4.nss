//Return TRUE if the opening cutscene is at stage 4.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 4)
    {
        return TRUE;
    }
    return FALSE;
}
