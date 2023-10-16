//::///////////////////////////////////////////////
//:: Name: q2b_endcon_fairy
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    End of Evil Fairy conversation.
    Walk away dejected if she rips out her own heart
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nHeartless") == 1)
    {
        //Fairy will leave and reappear dead at her 2nd waypoint
        object oTarget1 = GetWaypointByTag("wp_q2bfairyleave");
        object oTarget2 = GetWaypointByTag("wp_q2bfairydead");

        SetImmortal(OBJECT_SELF, FALSE);
        ActionMoveToObject(oTarget1, TRUE);
        DestroyObject(OBJECT_SELF, 5.0);
        object oFairy = CreateObject(OBJECT_TYPE_CREATURE, "q2bfairy", GetLocation(oTarget2));
        SetImmortal(oFairy, FALSE);
        AssignCommand(oFairy, SetIsDestroyable(FALSE, FALSE, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(500), oFairy);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), oFairy);
    }
    else
    if (GetLocalInt(OBJECT_SELF, "nHostile") == 1)
    {
          SetImmortal(OBJECT_SELF, FALSE);
          SetIsTemporaryEnemy(GetPCSpeaker());
          DetermineCombatRound();
    }
    else
    if (GetLocalInt(OBJECT_SELF, "nLeaving") == 1)
    {
          //Fairy will leave and never come back
        object oTarget3 = GetWaypointByTag("wp_q2bfairyleave");
        SetImmortal(OBJECT_SELF, FALSE);
        ActionMoveToObject(oTarget3, TRUE);
        DestroyObject(OBJECT_SELF, 5.0);
    }
}
