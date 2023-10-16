///////Check if player has romance and if Aarin already spoken to
#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult =  GetLocalInt(OBJECT_SELF,"L_TALKTIMES") == 1 &&
               GetLocalInt(GetPCSpeaker(),"GENDROMANCE") != 99 &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET")) ;
  if (iResult == TRUE)
  {
     PlayCharacterTheme(53);
  }
    return iResult;
}
