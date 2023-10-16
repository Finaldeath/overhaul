// Updates the PC's journal entry and quest variables
// for the object being spoken to

#include "help_hench"

void main()
{
    SetLocalInt(OBJECT_SELF, "N_CONST_ACTIVATED", 0);

    SetLocalInt(GetPCSpeaker(), "N_DEACTIVATE_CONSTS", 1);
}
