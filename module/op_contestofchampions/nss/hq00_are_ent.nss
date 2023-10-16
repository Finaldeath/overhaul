#include "inc_rules"

void main()
{
    object oPlayer;

    oPlayer = GetEnteringObject();

    if ( GetLocalInt(oPlayer,"m_bAddGoldOnAreaJoin") == TRUE )
    {
        int nGoldToGivePlayer, nAllowedItemCost;

        nAllowedItemCost = GetAllowedItemCostForPlayer(oPlayer,TRUE);
        if ( nAllowedItemCost == ITEM_COST_UNLIMITED )
        {
            nGoldToGivePlayer = DEFAULT_AMOUNT_OF_STARTING_GOLD;
        }
        else
        {
            nGoldToGivePlayer = GetAllowedItemCostForPlayer(oPlayer) - GetTotalPlayerItemCost(oPlayer);
        }

        GiveGoldToCreature(oPlayer,nGoldToGivePlayer);
        DeleteLocalInt(oPlayer,"m_bAddGoldOnAreaJoin");
    }

    SetCommandable(TRUE,oPlayer);
}
