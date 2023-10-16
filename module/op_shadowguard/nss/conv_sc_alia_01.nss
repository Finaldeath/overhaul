// Sets the Speaking Object's "N_TALK_LVL"
// variable to its correct value

#include "help_conv"

void main()
{
    string sTag = GetTag(OBJECT_SELF);

    SetSelfTalkLevelInt(OBJECT_SELF, 3);

    object oPC = GetPCSpeaker();

    object oItem = GetItemPossessedBy(oPC, "IT_PLOT_004");

    SetLocalInt(oItem, "N_MODIFIED", 1);
}
