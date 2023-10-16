//Check if a PC has 150 gold.
int StartingConditional()
{
    if (GetGold(GetPCSpeaker())>149)
        return TRUE;
    return FALSE;
}
