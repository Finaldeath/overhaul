//::///////////////////////////////////////////////
//:: Check Charisma High and character female
//::
//:://////////////////////////////////////////////



#include "NW_I0_PLOT"

int StartingConditional()
{
    return CheckCharismaHigh() && GetGender(GetPCSpeaker()) ==  GENDER_FEMALE;
}


