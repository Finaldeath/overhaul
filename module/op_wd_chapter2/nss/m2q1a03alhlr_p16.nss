#include "NW_I0_Plot"

int StartingConditional()
{
    return (

    GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(), "M2Q1ITRING01"))
    &&
    GetLocalInt(GetModule(), "NW_G_ALHELOR_PLOT") >= 60
    );
}

