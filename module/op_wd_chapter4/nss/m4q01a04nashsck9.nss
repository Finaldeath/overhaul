//// Checks if Gend already spoken to and PC is a romance

#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_L_M4Q01TALKGEND") ==1 &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET2"));

    if (iResult == TRUE && GetTag(OBJECT_SELF) == "M4Q01A04AARI")
    {
        PlayCharacterTheme(53);
    }


    return iResult;
}


