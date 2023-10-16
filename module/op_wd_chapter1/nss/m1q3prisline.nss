int StartingConditional()
{
    return !GetIsPC(GetPCSpeaker()) || GetLocked(GetNearestObjectByTag("M1Q3BSamDoor"));
}
