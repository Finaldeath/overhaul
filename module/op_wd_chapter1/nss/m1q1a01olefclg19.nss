#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = CheckIntelligenceLow() &&
                    ( (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Book2")) &&
                       GetLocalInt(GetModule(),"NW_G_M1S1BookReturned") == FALSE)
                     ||
                      (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Tyr")) &&
                       GetLocalInt(GetModule(),"NW_G_M1S1SymbolReturned") == FALSE)
                     ||
                      (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Armor")) &&
                       GetLocalInt(GetModule(),"NW_G_M1S1ArmorReturned") == FALSE)
                     ||
                      (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Quill")) &&
                       GetLocalInt(GetModule(),"NW_G_M1S1QuillReturned") == FALSE) );
    return bCondition;
}

