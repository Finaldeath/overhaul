void main()
{
    int iDLGRunning = GetLocalInt(OBJECT_SELF, "flg_cutrunning");
    object oPC = GetFirstPC();

    if (iDLGRunning == TRUE)
    {
        SetLocalInt(OBJECT_SELF, "flg_cutrunning", TRUE);
        SetCutsceneMode(oPC, FALSE);
    }
}
