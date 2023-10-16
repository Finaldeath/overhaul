//Return TRUE if the opening cutscene is at stage 6.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 6)
    {
        return TRUE;
    }
    return FALSE;
}
