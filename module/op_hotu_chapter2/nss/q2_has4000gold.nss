//checks if player has 4000 gold

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) >= 4000)
        return TRUE;
    return FALSE;


}
