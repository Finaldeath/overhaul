#include "m2_i0_plot"

void main()
{
    SetPartyLocalInt(GetPCSpeaker(), "NW_L_M2Q1A02NEURIK_PLOT", 50);
    object oJourn = GetItemPossessedBy(GetPCSpeaker(),"M2Q1ITKARJOURN");
    if (GetIsObjectValid(oJourn))
    {
        ActionTakeItem(oJourn,GetPCSpeaker());
    }
}
