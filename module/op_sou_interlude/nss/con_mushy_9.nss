//Check if a PC has 40000 gold.
int StartingConditional()
{
    if (GetGold(GetPCSpeaker())>39999)
        return TRUE;
    return FALSE;
}
