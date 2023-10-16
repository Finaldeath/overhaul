// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    SetLocalInt(OBJECT_SELF, "N_CONST_ACTIVATED", 1);

    SetLocalInt(GetPCSpeaker(), "N_RESET_CONSTS", 1);
}
