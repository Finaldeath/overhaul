//Return TRUE if the opening cutscene is at stage 3.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 3)
    {
        return TRUE;
    }
    return FALSE;
}
