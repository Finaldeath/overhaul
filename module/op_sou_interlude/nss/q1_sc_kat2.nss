// Katriana starting conditional: Player returned with Zidan
#include "x1_inc_plot"

int StartingConditional()
{
    object oZidan = GetNearestObjectByTag("Q1_ZIDAN");
    if(oZidan == OBJECT_INVALID || GetArea(oZidan) != GetArea(OBJECT_SELF))
        return FALSE;
    return GetPlot("Q1_JOURNAL_MISSING_GUIDE") == 50;
}
