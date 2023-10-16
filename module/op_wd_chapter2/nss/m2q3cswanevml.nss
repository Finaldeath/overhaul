#include "NW_I0_PLOT"

int StartingConditional()
{
    int l_iResult;

    l_iResult = CheckCharismaLow() &&
                GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q01IWARDWANEV")) &&
                GetGender(GetPCSpeaker()) == GENDER_MALE;
    return l_iResult;
}
