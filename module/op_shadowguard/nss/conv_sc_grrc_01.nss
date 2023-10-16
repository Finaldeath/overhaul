#include "help_conv"

void main()
{
    string sTag = GetTag(OBJECT_SELF);

    SetSelfTalkLevelInt(OBJECT_SELF, 2);

    object o = GetFirstObjectInArea();

    object oPC = GetPCSpeaker();

    object oDoor = GetNearestObjectByTag("DOOR_019_0_0", oPC);

    SetLocalInt(oPC, "N_RC_GUARDS_ENTERED", 1);

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == GetTag(OBJECT_SELF))
        {
            SetLocalInt(o, "N_DONT_SPEAK", 1);

            AssignCommand(o, ActionMoveToObject(oDoor));

            DestroyObject(o, 2.5);
        }

        o = GetNextObjectInArea();
    }
}
