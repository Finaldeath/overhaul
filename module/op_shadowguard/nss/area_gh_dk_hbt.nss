#include "help_general"
#include "help_hench"

void MoveToBoat(object oRC, object oWP)
{
    SetLocalInt(oRC, "N_MOVING_TO_BOAT", 1);

    if (!(GetIsInCombat(oRC)) && GetArea(oRC) == GetArea(GetFirstPC()))
    {
        AssignCommand(oRC, ActionMoveToLocation(GetLocation(oWP), TRUE));

        if (GetLocalInt(oRC, "N_DO_BOAT_THING_ONCE") == 0 && GetTag(oRC) == "CT_UNIQ_RC_MIKE" && GetDistanceBetween(oRC, oWP) < 10.0)
        {
            SetLocalInt(oRC, "N_DO_BOAT_THING_ONCE", 1);

            SceneSpeak(oRC, "Here is our boat!  Quickly, we must make our escape!");

            AssignCommand(oRC, PlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 16.0));

            DelayCommand(10.0, SceneSpeak(oRC, "[Just as Mikel brings the boat nearly close enough to board, a great ball of flame comes soaring over the docks, consuming both the roguish Half-Elf, and his boat...]"));

            DelayCommand(16.0, SceneSpeak(oRC, "What the..."));

            SetLocalInt(oRC, "N_DONT_DESTROY_ON_DEATH", 1);

            DelayCommand(16.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_FIREBALL), GetLocation(oWP)));

            object o = GetFirstObjectInArea();

            while (o != OBJECT_INVALID)
            {
                if (GetLocalInt(o, "N_MOVING_TO_BOAT") == 1)
                    DelayCommand(18.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), o));

                o = GetNextObjectInArea();
            }
        }
    }

    if (!(GetIsDead(oRC)) && oRC != OBJECT_INVALID)
        DelayCommand(6.0, MoveToBoat(oRC, oWP));
}

void main()
{
    object oWP = GetWaypointByTag("MP_MIKELS_BOAT");

    object o = GetFirstObjectInArea();

    while (o != OBJECT_INVALID)
    {
        if (GetTag(o) == "CT_UNIQ_RC_MIKE" || GetTag(o) == "CT_COMM_RC_GUAR")
            MoveToBoat(o, oWP);

        o = GetNextObjectInArea();
    }
}
