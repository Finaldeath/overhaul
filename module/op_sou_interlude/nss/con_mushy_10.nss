//Check if a PC has 35000 gold.
int StartingConditional()
{
    if (GetGold(GetPCSpeaker())>34999)
        return TRUE;
    return FALSE;
}
