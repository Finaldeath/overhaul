#include "nw_i0_plot"
int StartingConditional()
{
    int l_iResult;

     l_iResult = GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 0;
     if (l_iResult == TRUE)
     {
        PlayCharacterTheme(53);
     }
     return l_iResult;
}

