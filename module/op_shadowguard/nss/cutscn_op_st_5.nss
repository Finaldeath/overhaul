//Return TRUE if the opening cutscene is at stage 5.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 5)
    {
        return TRUE;
    }
    return FALSE;
}
