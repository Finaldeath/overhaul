#include "inc_module"

void main()
{
    int nAllowedCost;
    object oPlayer;

    nAllowedCost = GetAllowedItemCostForPlayer(oPlayer,TRUE);
    SetCustomToken(500,IntToString(nAllowedCost));
}
