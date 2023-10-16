#include "help_general"

void FollowPC(object o, object oPC)
{
    if (GetLocalInt(oPC, "N_ANAG_FOLLOW") == 1)
    {
        if (!(GetIsInCombat(o)))
        {
            object oDoor = GetNearestObjectByTag("WP_ANAG_MOVE", o);

            if (GetIsObjectValid(oDoor))
            {
                if (GetDistanceBetween(oDoor, o) > 10.0)
                    AssignCommand(o, ActionMoveToObject(oDoor, TRUE));

                else
                {
                    if (GetTag(o) == "CT_UNIQ_SH_ANAG")
                    {
                        int nRand = Random(5);

                        if (nRand == 0)
                            SceneSpeak(o, "Death to the enemy!  Let us strike down our foes for the glory of Rakha!");
                    }
                }
            }

        }
    }

    DelayCommand(6.0, FollowPC(o, oPC));
}

void AidPC(object oPC, object oSelf)
{
    if (GetLocalInt(oSelf, "N_FIRST_TIME") == 0)
    {
        object o = GetFirstFactionMember(oSelf, FALSE);

        while (o != OBJECT_INVALID)
        {
            if (GetArea(oSelf) == GetArea(o))
            {
                FollowPC(o, oPC);
            }

            o = GetNextFactionMember(oSelf, FALSE);
        }

        SetLocalInt(oSelf, "N_FIRST_TIME", 1);
    }
}

void main()
{
    SetLocalInt(GetPCSpeaker(), "N_ANAG_FOLLOW", 1);

    AidPC(GetPCSpeaker(), OBJECT_SELF);
}
