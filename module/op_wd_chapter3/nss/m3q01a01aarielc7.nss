#include "M3PLOTINCLUDE"
#include "nw_i0_plot"
int StartingConditional()
{
 int l_iResult;

 l_iResult =GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 3 &&
  GetLocalObject(OBJECT_SELF,"NW_L_M3Q01TALKPARTYLEADER") != GetPCSpeaker();

 ////Also check player doesn't have a word of Power on him////
  if (l_iResult == TRUE)
  {
     PlayCharacterTheme(53);
  }
 return (l_iResult && (HaveAnyWord(GetPCSpeaker()) == FALSE) );
}
