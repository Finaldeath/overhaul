#include "inc_rules"

void main()
{
    object oPlayer;
    int nAllowedItemCost;

    oPlayer = GetPCSpeaker();

    nAllowedItemCost = GetAllowedItemCostForPlayer(oPlayer);
    SetCustomToken(500,IntToString(nAllowedItemCost));
}

