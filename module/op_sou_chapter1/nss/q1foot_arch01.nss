// if the PC is eligible for Arcane Archer

int StartingConditional()
{
    int nRace = GetRacialType(GetPCSpeaker());
    int nClass1 = GetLevelByClass(CLASS_TYPE_WIZARD, GetPCSpeaker());
    int nClass2 = GetLevelByClass(CLASS_TYPE_SORCERER, GetPCSpeaker());
    int nClass3 = GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());

    if ((nRace == RACIAL_TYPE_ELF) || (nRace == RACIAL_TYPE_HALFELF))
    {
        if ((nClass1 > 0) || (nClass2 > 0) || (nClass3 > 0))
        {
            return TRUE;
        }
    }
    return FALSE;
}
