
int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iHenchMax = GetMaxHenchmen();
    object oHench = GetHenchman(oPC, iHenchMax);
    int iResult = FALSE;

    if(GetIsObjectValid(oHench) == TRUE)
    {
        iResult = TRUE;
    }

    return iResult;
}
