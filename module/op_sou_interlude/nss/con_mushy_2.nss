//Check if a PC has 200 gold.
int StartingConditional()
{
    if (GetGold(GetPCSpeaker())>199)
        return TRUE;
    return FALSE;
}
