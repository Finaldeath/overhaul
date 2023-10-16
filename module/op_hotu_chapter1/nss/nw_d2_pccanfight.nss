// NW_D2_PCCANFIGHT
//
// Checks to see if at least half of the PC's total levels
// are dedicated to fighting classes

int StartingConditional()
{
    int nClass = GetLevelByClass(CLASS_TYPE_BARBARIAN, GetPCSpeaker())
               + GetLevelByClass(CLASS_TYPE_FIGHTER, GetPCSpeaker())
               + GetLevelByClass(CLASS_TYPE_MONK, GetPCSpeaker())
               + GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker())
               + GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker());
    int nTotal = ((GetHitDice(GetPCSpeaker())) / 2);
    if (nClass > nTotal)
    {
        return TRUE;
    }
    return FALSE;
}
