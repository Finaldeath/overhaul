#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetObjectByTag("M2Q1CNEURIK"), "NW_J_FETCHPLOT") >= 10;
    return iResult;
}
