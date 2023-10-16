// the PC has the child toy

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = HasItem(GetPCSpeaker(),"M2Q4A_Child_Toy");
    return iResult;
}
