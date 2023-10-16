// Zidan starting conditional: Zidan is still held by the magics of the altar
#include "x1_inc_plot"

int StartingConditional()
{
    object oAltar = GetObjectByTag("Q1_ALTAR");
    return oAltar != OBJECT_INVALID;
}
