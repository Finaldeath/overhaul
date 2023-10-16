//Return TRUE if the opening cutscene has not yet hit stage 1.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iStage = GetLocalInt(oPC, "iOpeningCutscene");

    if (iStage == 0)
    {
        return TRUE;
    }
    return FALSE;
}
