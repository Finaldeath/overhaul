// * Will only say this if the player has
// * a decent charisma and is male
#include "nw_i0_plot"

int StartingConditional()
{
    int iGender = GetGender(GetPCSpeaker());
    if (iGender == GENDER_MALE)
    {
        return CheckCharismaNormal();
    }
    return FALSE;
}

