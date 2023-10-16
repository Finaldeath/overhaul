#include "inc_rules"

void main()
{
    object oPlayer;
    int nTotalPlayerCost;

    oPlayer = GetPCSpeaker();

    nTotalPlayerCost = GetTotalPlayerItemCost(oPlayer);
    SetCustomToken(500,IntToString(nTotalPlayerCost));
}

