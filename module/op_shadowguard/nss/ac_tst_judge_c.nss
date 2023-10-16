//Return TRUE if the Judge ritual has not yet been explained.

int StartingConditional()
{
    int iJudge = GetLocalInt(GetModule(), "iGRAD_JUDGE");
    if (iJudge == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
