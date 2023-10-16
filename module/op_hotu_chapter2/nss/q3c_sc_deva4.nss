int StartingConditional()
{
    return GetLocalInt(GetPCSpeaker(), "TALKED") == 1;
}
