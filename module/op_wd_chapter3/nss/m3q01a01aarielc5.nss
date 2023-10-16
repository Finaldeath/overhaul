#include "nw_i0_plot"
int StartingConditional()
{
 int l_iResult;

 l_iResult =GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 2 &&
  GetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER") == GetPCSpeaker();
  if (l_iResult == TRUE)
  {
     PlayCharacterTheme(53);
  }
 return l_iResult;
}

