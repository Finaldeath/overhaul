//Check if PC spoke to Nilmaldor once.
int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "Q2_SPOKEN_TO_NILMALDOR")== 1)
        return TRUE;
    return FALSE;
}
