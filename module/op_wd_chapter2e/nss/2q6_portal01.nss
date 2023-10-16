// a medium Lore check made

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = AutoDC(DC_MEDIUM,SKILL_LORE,OBJECT_SELF) == TRUE;
    return iResult;
}
