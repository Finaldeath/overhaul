// the PC is level 1+ in Bard or Rogue
// or has successfully checked this out before

int StartingConditional()
{
    int nClass1 = GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker());
    int nClass2 = GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());
    int nTry = GetLocalInt(GetPCSpeaker(), "q3_Translation_Attempt");

    if (((nClass1 > 0) || (nClass2 > 0)) && (nTry == 0))
    {
        return TRUE;
    }
    else if (nTry == 1)
    {
        return TRUE;
    }
    return FALSE;
}
