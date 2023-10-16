//Return TRUE if the opening cutscene is at stage 1.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 1)
    {
        return TRUE;
    }
    return FALSE;
}
