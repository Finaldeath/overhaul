//::///////////////////////////////////////////////
//:: Name  q1j2_exit_ktrap
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
        Have two kobolds 'spring' out of the ground
        and attack the PC when the trap is exited.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On: Feb 15/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    if (GetIsPC(oPC) == TRUE && GetLocalInt(OBJECT_SELF, "nTriggered") != 1)
    {
        if (GetStealthMode(oPC) == FALSE)
        {
            SetLocalInt(OBJECT_SELF, "nTriggered", 1);
            effect eDamage = EffectDamage(5);
            location lBoulder1 = GetLocation(GetWaypointByTag("wp_q1jkobold_1"));
            location lBoulder2 = GetLocation(GetWaypointByTag("wp_q1jkobold_2"));
            //Create boulders and blow them up to create earth shower effect
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), lBoulder1);
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(137), lBoulder2);
            //create kobolds and attack pc
            object oKobold1 = CreateObject(OBJECT_TYPE_CREATURE, "q1j_kobold1", lBoulder1);
            object oKobold2 = CreateObject(OBJECT_TYPE_CREATURE, "q1j_kobold1", lBoulder2);
            AssignCommand(oKobold1, ActionAttack(oPC));
            AssignCommand(oKobold2, ActionAttack(oPC));
            AssignCommand(oPC, PlaySound("as_cv_woodbreak1"));
        }
    }
}
