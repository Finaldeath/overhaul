///////Check if player has romance and second amulet
#include "nw_i0_plot"
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"GENDROMANCE") != 99 &&

              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET2")) ;
  if (iResult == TRUE)
  {
     PlayCharacterTheme(53);
  }
    return iResult;
}

