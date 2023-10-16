#include "M3PLOTINCLUDE"
#include "nw_i0_plot"
int StartingConditional()
{
 int l_iResult;

 /////Talk Times at 3 AND Player has Word of Power//////

 l_iResult =GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 3
    && (HaveAnyWord(GetPCSpeaker()) == TRUE);
  if (l_iResult == TRUE)
  {
     PlayCharacterTheme(53);
  }
 return l_iResult;
}

