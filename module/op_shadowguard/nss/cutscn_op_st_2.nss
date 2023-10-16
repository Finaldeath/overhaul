//Return TRUE if the opening cutscene is at stage 2.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 2)
    {
        return TRUE;
    }
    return FALSE;
}
