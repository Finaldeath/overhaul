///Checks if PC was evil to character
////character reacts negatively and closes off information
#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalObject(OBJECT_SELF,"Evil") !=GetPCSpeaker();
              CheckIntelligenceLow();
    return iResult;
}
