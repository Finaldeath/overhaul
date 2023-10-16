int StartingConditional()
{
    int nFeat = FEAT_DISARM;

    object oPC = GetPCSpeaker();

    return GetHasFeat(nFeat, oPC);
}
