#include "help_hench"

void main()
{
    string sName = GetName(OBJECT_SELF);

    string sTag = GetTag(OBJECT_SELF);

    object oPC = GetPCSpeaker();

    SetLocalInt(oPC, sTag + "_INTERLUDE_PAST", 1);

    SendMessageToPC(oPC, "[You have learned more about your fellow Shadowguard member, " + sName + ".]");

    GiveXPToCreature(oPC, HENCH_INTERLUDE_XP);
}
